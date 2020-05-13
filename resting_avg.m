% written by liangying,4/24/2019
clear;
clc;

subj_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/stress_Trait.txt';
raw_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/RS/Trait/stress/r_map' ;

fid = fopen(subj_dir);
subj = textscan(fid,'%s');
fclose(fid);

num = length(subj{1});    % num=length(subj)=1,��Ϊsubj��cell����
avg_ECN = zeros(1,num);     % Ԥ�����ڴ����Ч��
avg_DMN = zeros(1,num);
avg_ECN_DMN = zeros(1,num);


for i=1:num
    eval(['rootname = fullfile(raw_dir,''r_map_',subj{1}{i},'_REST'')']); % ��Ϊ.mat�ļ������������W�������޸��ļ���
    extension = '.mat';
    filename = [rootname,extension];
    load(filename);   % ���뵽���������ļ��������W
 %   eval(['subj',num2str(i),'= ','W',';']);   % ��W��ֵ��subj1��subj2....
    variable = ['subj',num2str(i)];
    save(filename,variable);  % ����r������.mat��,�м�һ��Ҫ�ڱ����ϼ�''����Ϊmatlab��save������ͨ���ַ���ȥѰ�ҹ������ı���
   % clear W;
    
    r = eval(variable);  % rΪ��ǰ���Ե�rֵ����
    ECN = r([1:6],[1:6]);  % ѧϰ�Ӵ��������ȡС�����д��
    s = (sum(ECN(:))-6)/2;
    avg_ECN(i) = s/15;
    
    DMN = r([7:12],[7:12]);
    s = (sum(DMN(:))-6)/2;
    avg_DMN(i) = s/15;
    
    ECN_DMN = r([7:12],[1:6]);
    s = sum(ECN_DMN(:));
    avg_ECN_DMN(i) = s/36;
    
end

    save('D:/brainbnu/brain_software/ROIs/Menglu/Adult/avg_result/avg_ECN.mat', 'avg_ECN');  % ������ļ�Ҫд����׺.mat
    save('D:/brainbnu/brain_software/ROIs/Menglu/Adult/avg_result/avg_DMN.mat', 'avg_DMN');
    save('D:/brainbnu/brain_software/ROIs/Menglu/Adult/avg_result/avg_ECN_DMN.mat', 'avg_ECN_DMN');

