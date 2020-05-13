% adapted by liangying for CHS project, 6/24/2019
% Detailed documentation and further examples can be found in:
% https://github.com/OHBA-analysis/HMM-MAR
% This pipeline must be adapted to your particular configuration of files. 
%%%%%%%%%%%%%%%%%%%%%%%%%
%% SETUP THE MATLAB PATHS AND FI LE NAMES
clear;
clc;
mydir = 'D:/brainbnu/spm12_scripts_ying/HMM-MAR-master/HMM-MAR-master';
addpath(genpath([ mydir 'HMM-MAR']))   % 手动将这个包添加进路径

subj_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/sub_all.txt';
raw_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/ROI_preproc/WM/roi_ts/';
DirOut = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=20_3/';

fid = fopen(subj_dir);
subj = textscan(fid,'%s');
fclose(fid);

N = length(subj{1}); % no. subjects

K = 20; % no. states
repetitions = 1; % to run it multiple times (keeping all the results)
% DirData = [mydir 'data/HCP/TimeSeries/hippocampus_data/'];
TR = 2;  
use_stochastic = 0; % set to 1 if you have loads of data

% N = 820; 
f = cell(N,1); T = cell(N,1);
% each .mat file contains the data (ICA components) for a given subject, 
% in a matrix X of dimension (4800time points by 50 ICA components). 
% T{j} contains the lengths of each session (in time points)
for j=1:N
    eval(['rootname = fullfile(raw_dir,''roi_ts_',subj{1}{j},'_WM.'')']); 
    extension = 'mat';
    f{j} = [rootname,extension];
    load(f{j});
    % f{j} = [DirData 's' num2str(j) '.mat'];
    %load(f{j}); 
    T{j} = [228];
    %T{j} = [170 150 228];
end

options = struct();
%options.pca = 0.9;
options.K = K; % number of states 
options.order = 0; % no autoregressive components
options.zeromean = 1; % model the mean
options.covtype = 'full'; % full covariance matrix
options.Fs = 1/TR; 
options.verbose = 1;
options.standardise = 1;    %做了标准化normalization,mean=0,deviation=1
options.inittype = 'HMM-MAR';
options.cyc = 500;  % 1000
options.initcyc = 10;  % 100
options.initrep = 3;  % 5
%options.p = 0;

% stochastic options
if use_stochastic
    options.BIGNbatch = round(N/30);
    options.BIGtol = 1e-7;
    options.BIGcyc = 500;
    options.BIGundertol_tostop = 5;
    options.BIGforgetrate = 0.7;
    options.BIGbase_weights = 0.9;
end

% We run the HMM multiple times
for r = 1:repetitions
    [hmm, Gamma, ~, vpath] = hmmmar(f,T,options);
    save([DirOut 'HMMrun_rep' num2str(r) '.mat'],'Gamma','vpath','hmm','T','options')
    disp(['RUN ' num2str(r)])
end



