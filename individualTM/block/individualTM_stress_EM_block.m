% written by Liangying,9/12/2019
% we concentrate on emotion block; stress group

clear;
clc;

load('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\tc.mat')
load('D:\brainbnu\brain_software\ShareFolders\CHS_project\E-data\EM\onset1_brain.mat')

N = 33;     % number of subjects,stress group
K = 8;    % number of states
duration = 15;   % durations of each block

onset1_brain = onset1_brain(1:33,:);   % stress group 
[m,n] = size(onset1_brain);
block = n;
tcBlock = cell(N,block);
tmp = zeros(K,K,block);

tc = tc(1:33,:);     % stress group 
[r,c] = size(tc);
TM_stress_block = cell(r,n);
TM_stress_EM_block = cell(r,1);
avg_TM_stress_EM_block = zeros(K,K);
cat_TM_stress_EM_block = zeros(K,K,r);
p = 0;
q = 0;


T0 = zeros(33,1);
T1 = zeros(33,1);
T2 = zeros(33,1);
T3 = zeros(33,1);

for i=1:33
    T0(i) = 548;
    T1(i) = 170;   
    T2(i) = 15;   % the durations of EM tasks, need to change!!! transfer 's' to 'TR'
    T3(i) = 14;   % the durations of WM tasks, need to change!!! transfer 's' to 'TR'
end

for j = 1:N
        t0 = 170;   % need to change!!!
        if(onset1_brain(j,n) == 0)    % to see if this subject has abnormal blocks and trials
                block = n-1;
        else
                block = n;
        end
        for i = 1:block
            t1 = t0 + onset1_brain(j,i); 
            ind = (1:T2(j)) + t1;      % need to change!!! , T2 is the duration, which is the same in each block
            tcBlock{j,i} = tc(j,ind);
        end
end



for i = 1:r
    if(onset1_brain(i,n) == 0)    % to see if this subject has abnormal blocks and trials
             block = n-1;
    else
             block = n;
    end
    for j = 1:block
        TM_stress_block{i,j} = zeros(K,K);
        for k = 1:T2(i)-1
            p = tcBlock{i,j}(k);
            for s = 1:K
                if(tcBlock{i,j}(k+1) == s)
                    TM_stress_block{i,j}(p,s) = TM_stress_block{i,j}(p,s)+1;
                    break;
                end
            end
        end
        tmp(:,:,j) = TM_stress_block{i,j}/(duration - 1);
    end
    TM_stress_EM_block{i,1} = sum(tmp,3) / block;
end


%%%%写到这，明天继续，还要修改前面的block问题，以后记得用常量，而不是每次循环都改变的变量

save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\TM_stress_EM_block.mat','TM_stress_EM_block');

for i = 1:r
    cat_TM_stress_EM_block(:,:,i) = TM_stress_EM_block{i};
end
 avg_TM_stress_EM_block = mean(cat_TM_stress_EM_block,3);

save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\cat_TM_stress_EM_block.mat','cat_TM_stress_EM_block');
save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\avg_TM_stress_EM_block.mat','avg_TM_stress_EM_block');


