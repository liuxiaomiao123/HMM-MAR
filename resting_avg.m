% written by liangying,4/24/2019
clear;
clc;

subj_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/stress_Trait.txt';
raw_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/RS/Trait/stress/r_map' ;

fid = fopen(subj_dir);
subj = textscan(fid,'%s');
fclose(fid);

num = length(subj{1});    % num=length(subj)=1,因为subj是cell数组
avg_ECN = zeros(1,num);     % 预分配内存提高效率
avg_DMN = zeros(1,num);
avg_ECN_DMN = zeros(1,num);


for i=1:num
    eval(['rootname = fullfile(raw_dir,''r_map_',subj{1}{i},'_REST'')']); % 因为.mat文件导入后名字是W，所以修改文件名
    extension = '.mat';
    filename = [rootname,extension];
    load(filename);   % 导入到工作区后文件名都变成W
 %   eval(['subj',num2str(i),'= ','W',';']);   % 将W赋值给subj1、subj2....
    variable = ['subj',num2str(i)];
    save(filename,variable);  % 保存r变量到.mat中,切记一定要在变量上加''，因为matlab的save函数是通过字符串去寻找工作区的变量
   % clear W;
    
    r = eval(variable);  % r为当前被试的r值矩阵
    ECN = r([1:6],[1:6]);  % 学习从大矩阵中提取小矩阵的写法
    s = (sum(ECN(:))-6)/2;
    avg_ECN(i) = s/15;
    
    DMN = r([7:12],[7:12]);
    s = (sum(DMN(:))-6)/2;
    avg_DMN(i) = s/15;
    
    ECN_DMN = r([7:12],[1:6]);
    s = sum(ECN_DMN(:));
    avg_ECN_DMN(i) = s/36;
    
end

    save('D:/brainbnu/brain_software/ROIs/Menglu/Adult/avg_result/avg_ECN.mat', 'avg_ECN');  % 保存的文件要写出后缀.mat
    save('D:/brainbnu/brain_software/ROIs/Menglu/Adult/avg_result/avg_DMN.mat', 'avg_DMN');
    save('D:/brainbnu/brain_software/ROIs/Menglu/Adult/avg_result/avg_ECN_DMN.mat', 'avg_ECN_DMN');

