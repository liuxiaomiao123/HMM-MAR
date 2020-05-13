% written by liangying, 7/26/2019
% since we concatenate RS,WM,EM, change the number of T when calculate the
% FO within each session (and also change the start point i in getFractionalOccupancy.m)

clear;
clc;

repetitions = 2;
DirOut = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/New/HMM_result/stress/k=10_2/';
N = 33;     % number of subjects
K = 10;     % number of states
T1 = zeros(33,1);
T2 = zeros(33,1);
T3 = zeros(33,1);

for i=1:33
    T1(i) = 170;
    T2(i) = 228;
    T3(i) = 150;
end
    
r = 2;
%for r = 1:repetitions
    load([DirOut 'HMMrun_rep' num2str(r) '.mat']);
    FO_rs = getFO_sessionRS (Gamma,T,T1,options);   % make sure getFractionalOccupancy.m is in the workspace, otherwise change it
    FO_wm = getFO_sessionRS (Gamma,T,T2,options);
    FO_em = getFO_sessionRS (Gamma,T,T3,options);
    
    save([DirOut 'FO_rs' num2str(r) '.mat'],'FO_rs');  
    save([DirOut 'FO_wm' num2str(r) '.mat'],'FO_wm'); 
    save([DirOut 'FO_em' num2str(r) '.mat'],'FO_em'); 
%end



   