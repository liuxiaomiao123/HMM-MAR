% Adapated by liangying, 14/1/2019 
clear;
clc;

data_dir = '/brain/iCAN/home/LiuLiangying/MDD/data3';
subj_dir = '/brain/iCAN/home/LiuLiangying/MDD/rawdata/MDD_subj3.txt'
duration = [30,30,30,30,30];

fid = fopen(subj_dir);
sublist = textscan(fid,'%d %s');  % 1x2cell

load onset1.mat    % ��onset1.mat���������ݼ��ص���ǰ��������
load onset2.mat
%onset1=[0,139.991,174.988,209.986,314.996];
%onset2=[34.997,69.995,109.992,245,279.998];
%duration1=[30,30,30,30,30];
%duration2=[30,35,25,30,30];


for i = 1:length(sublist{1})
    tmp = sublist{2}(i);
    Year = ['20' tmp{1}(1:2)];
    DesignDir  = fullfile(data_dir,Year,char(sublist{2}(i)),'fmri/EM/task_design');  % char��cell����ת��str����
    mkdir (DesignDir);
    cd (DesignDir);
    Design = fopen('task_design.m','w');
    
    fprintf(Design, '%s\n',     'sess_name = ''EM'';');  %�������������������Ϊ��Ҫ��EM����ţ���sess_name='EM'
    
    fprintf(Design, '%s\n',      'names{1} = ''Emotion'';');
    fprintf(Design, '%s\n',    ['onsets{1} = [',num2str(onset1(i,:)),'];']);
    fprintf(Design, '%s\n', ['durations{1} = [',num2str(duration),'];']);
    
    fprintf(Design, '%s\n',      'names{2} = ''Control'';');
    fprintf(Design, '%s\n',    ['onsets{2} = [',num2str(onset2(i,:)),'];']);
    fprintf(Design, '%s\n', ['durations{2} = [',num2str(duration),'];']);
    
    fprintf(Design, '%s\n','rest_exists  = 1;');
    fprintf(Design, '%s\n','save task_design.mat sess_name names onsets durations rest_exists');
end