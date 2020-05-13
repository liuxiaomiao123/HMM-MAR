% written by liangying,7/16/2019
clear;
clc;

N = 52;  % number of subjects
%t = 548; % length of one session (TRs),如果用T的话会与下面导入的hmm名字冲突，所以改成小写
t = 228;
j = 1;

load('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=20_3\HMMrun_rep1.mat')
flag = 1;
tc = zeros(N,t);
sum = N * t;

for i=1:sum
    if(j > t)
        j = 1;
        flag = flag+1;
    end
    tc(flag,j) = vpath(i);
    j = j+1;
end

save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=20_3\tc.mat','tc')