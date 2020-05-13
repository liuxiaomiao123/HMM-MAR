% written by liangying,7/14/2019
clear;
clc;

raw_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/mean/' ;

num = 10;    % num = repetitions, 一共跑了多少次

for i=1:num
    eval(['rootname = fullfile(raw_dir,''m',num2str(i),'.'')']); % 因为.mat文件导入后名字是W，所以修改文件名
    extension = 'mat';
    filename = [rootname,extension];
    load(filename);   % 导入到工作区后文件名都变成m
    eval(['m',num2str(i),'= ','m',';']);
    variable = ['m',num2str(i)];
    save(filename,variable);
end

M = [m1',m2',m3',m4',m5',m6',m7',m8',m9',m10'];   %need to change!!!
corr = corrcoef(M);
save('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/mean/M.mat','M')
save('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/mean/corr_mean.mat','corr')
   
