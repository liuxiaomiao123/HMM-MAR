% written by liangying,7/20/2019
% .matֻ��һ���ļ������ѣ���*.txt���ƣ�������ı������޹أ������ı�����ȫ�����all_roi_ts����ô��ν���Щ
% �����������أ�ͨ����ֵ���м����variable����all_roi_ts��������ٽ�variable�浽ԭ�����ļ������ɡ�
clear;
clc;

subj_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/sub_all.txt';
sub_em_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/sub_em_all.txt';
raw_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/ROI_preproc/all/';
raw_dir2 = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/ROI_preproc/concatenate/';

fid = fopen(subj_dir);
subj = textscan(fid,'%s');
fclose(fid);

fid = fopen(sub_em_dir);
subj_em = textscan(fid,'%s');
fclose(fid);


num = length(subj{1});    % num=length(subj)=1,��Ϊsubj��cell����


for i=1:num
    eval(['rootname1 = fullfile(raw_dir,''roi_ts_',subj{1}{i},'_RS'')']); % ��Ϊ.mat�ļ������������W�������޸��ļ���
    eval(['rootname2 = fullfile(raw_dir,''roi_ts_',subj_em{1}{i},'_emotion'')']);
    eval(['rootname3 = fullfile(raw_dir,''roi_ts_',subj{1}{i},'_WM'')']); 

    eval(['rootname4 = fullfile(raw_dir2,''roi_ts_',subj{1}{i},'.'')']); 
    extension = '.mat';
    extension2 = 'mat';
    filename1 = [rootname1,extension];
    filename2 = [rootname2,extension];
    filename3 = [rootname3,extension];
    filename4 = [rootname4,extension2];
    
    
    load(filename1);   % ���뵽���������ļ��������all_roi_ts
    eval(['subj',num2str(i),'_RS','= ','all_roi_ts',';']);   % ��all_roi_ts��ֵ��subj1��subj2....
    variable1 = ['subj',num2str(i),'_RS'];
    save(filename1,variable1); 
    clear all_roi_ts;
    
    load(filename2);  
    eval(['subj',num2str(i),'_EM','= ','all_roi_ts',';']);   
    variable2 = ['subj',num2str(i),'_EM'];
    save(filename2,variable2); 
    clear all_roi_ts;
    
    load(filename3);  
    eval(['subj',num2str(i),'_WM','= ','all_roi_ts',';']);   
    variable3 = ['subj',num2str(i),'_WM'];
    save(filename3,variable3);  
    clear all_roi_ts;
    
    v1=eval(variable1);
    v2=eval(variable2);
    v3=eval(variable3);
    variable4 = [v1;v2;v3];
    eval(['subj',num2str(i),'= ','variable4',';']);
    variable4 = ['subj',num2str(i)];
    save(filename4,variable4);
end