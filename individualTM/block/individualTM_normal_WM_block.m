% written by Liangying,9/12/2019
% we concentrate on 0vs2 block; control group
% 0 back is stored in /control/contrast/
% 2 back is stored in /k=5_1/

clear;
clc;

load('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\tc.mat')
load('D:\brainbnu\brain_software\ShareFolders\CHS_project\E-data\WM\onset2_brain.mat')

N = 19;     % number of subjects,stress group
K = 8;    % number of states
duration = 14;   % durations of each block

onset2_brain = onset2_brain(34:52,:);   % normal group 
[m,n] = size(onset2_brain);
block = n;
tcBlock = cell(N,block);
tmp = zeros(K,K,block);

tc = tc(34:52,:);     % normal group 
[r,c] = size(tc);
TM_normal_block = cell(r,n);
TM_normal_WM_block = cell(r,1);
avg_TM_normal_WM_block = zeros(K,K);
cat_TM_normal_WM_block = zeros(K,K,r);
p = 0;
q = 0;


T0 = zeros(r,1);
T1 = zeros(r,1);
T2 = zeros(r,1);
T3 = zeros(r,1);

for i=1:r
    T0(i) = 548;
    T1(i) = 170;   
    T2(i) = 15;   % the durations of EM tasks, need to change!!! transfer 's' to 'TR'
    T3(i) = 14;   % the durations of WM tasks, need to change!!! transfer 's' to 'TR'
end

for j = 1:N
        t0 = 320;   % need to change!!!
        if(onset2_brain(j,n) == 0)    % to see if this subject has abnormal blocks and trials
                block = n-1;
        else
                block = n;
        end
        for i = 1:block
            t1 = t0 + onset2_brain(j,i); 
            ind = (1:T3(j)) + t1;      % need to change!!! , T3 is the duration, which is the same in each block
            tcBlock{j,i} = tc(j,ind);
        end
end



for i = 1:r
    if(onset2_brain(i,n) == 0)    % to see if this subject has abnormal blocks and trials
             block = n-1;
    else
             block = n;
    end
    for j = 1:block
        TM_normal_block{i,j} = zeros(K,K);
        for k = 1:T3(i)-1    % need to change!!! T2 or T3
            p = tcBlock{i,j}(k);
            for s = 1:K
                if(tcBlock{i,j}(k+1) == s)
                    TM_normal_block{i,j}(p,s) = TM_normal_block{i,j}(p,s)+1;
                    break;
                end
            end
        end
        tmp(:,:,j) = TM_normal_block{i,j}/(duration - 1);
    end
    TM_normal_WM_block{i,1} = sum(tmp,3) / block;
end

save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\TM_normal_WM_block.mat','TM_normal_WM_block');

for i = 1:r
    cat_TM_normal_WM_block(:,:,i) = TM_normal_WM_block{i};
end
 avg_TM_normal_WM_block = mean(cat_TM_normal_WM_block,3);

save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\cat_TM_normal_WM_block.mat','cat_TM_normal_WM_block');
save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\avg_TM_normal_WM_block.mat','avg_TM_normal_WM_block');


