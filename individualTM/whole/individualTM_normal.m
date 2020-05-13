% written by Liangying,8/5/2019

clear;
clc;

load('D:\brainbnu\brain_software\ShareFolders\CHS_project\All2\HMM_result\k=5\k=5_1\tc.mat')
tc = tc(34:52,:);    % control group
K = 5;    % number of states
[r,c] = size(tc);
TM_normal = cell(r,1);
tmp = zeros(K,K);
avg_TM_normal = zeros(K,K);
cat_TM_normal = zeros(K,K,r);
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
    TM_normal{i} = tmp;
end

for i = 1:r
    for j = 1:K
        for k = 1:K
            TM_normal{i}(j,k) = TM_normal{i}(j,k) / (c-1);
        end
    end
end

save('D:\brainbnu\brain_software\ShareFolders\CHS_project\All2\HMM_result\k=5\k=5_1\TM_normal.mat','TM_normal');

for i = 1:r
    cat_TM_normal(:,:,i) = TM_normal{i};
end
 avg_TM_normal = mean(cat_TM_normal,3);

save('D:\brainbnu\brain_software\ShareFolders\CHS_project\All2\HMM_result\k=5\k=5_1\cat_TM_normal.mat','cat_TM_normal');
save('D:\brainbnu\brain_software\ShareFolders\CHS_project\All2\HMM_result\k=5\k=5_1\avg_TM_normal.mat','avg_TM_normal');


