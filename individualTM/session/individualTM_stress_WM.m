% written by Liangying,8/5/2019

clear;
clc;

load('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\tc.mat')
tc = tc(1:33,321:548);     % stress group ,WM
K = 8;    % number of states
[r,c] = size(tc);
TM_stress_WM = cell(r,1);
tmp = zeros(K,K);
avg_TM_stress_WM = zeros(K,K);
cat_TM_stress_WM = zeros(K,K,r);
p = 0;
q = 0;

for i = 1:r
    tmp = zeros(K,K);
    for j = 1:c-1
        p = tc(i,j);
        for q = 1:K
            if(tc(i,j+1) == q)
                tmp(p,q) = tmp(p,q) + 1;
                break;
            end
        end
    end
    TM_stress_WM{i} = tmp;
end

for i = 1:r
    for j = 1:K
        for k = 1:K
            TM_stress_WM{i}(j,k) = TM_stress_WM{i}(j,k) / (c-1);
        end
    end
end


save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\TM_stress_WM.mat','TM_stress_WM');

for i = 1:r
    cat_TM_stress_WM(:,:,i) = TM_stress_WM{i};
end
 avg_TM_stress_WM = mean(cat_TM_stress_WM,3);
 
save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\cat_TM_stress_WM.mat','cat_TM_stress_WM');
save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\avg_TM_stress_WM.mat','avg_TM_stress_WM');


