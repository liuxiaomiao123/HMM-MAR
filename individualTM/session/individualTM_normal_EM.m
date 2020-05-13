% written by Liangying,8/5/2019

clear;
clc;

load('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\tc.mat')
tc = tc(34:52,171:320);     % normal group ,EM
K = 8;    % number of states
[r,c] = size(tc);
TM_normal_EM = cell(r,1);
tmp = zeros(K,K);
avg_TM_normal_EM = zeros(K,K);
cat_TM_normal_EM = zeros(K,K,r);
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
    TM_normal_EM{i} = tmp;
end

for i = 1:r
    for j = 1:K
        for k = 1:K
            TM_normal_EM{i}(j,k) = TM_normal_EM{i}(j,k) / (c-1);
        end
    end
end

save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\TM_normal_EM.mat','TM_normal_EM');

for i = 1:r
    cat_TM_normal_EM(:,:,i) = TM_normal_EM{i};
end
 avg_TM_normal_EM = mean(cat_TM_normal_EM,3);

save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\cat_TM_normal_EM.mat','cat_TM_normal_EM');
save('D:\brainbnu\brain_software\ShareFolders\CHS_project\Final\HMM_result\k=8\k=8_1\avg_TM_normal_EM.mat','avg_TM_normal_EM');


