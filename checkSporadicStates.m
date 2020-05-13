% written by liangying,7/29/2019
clear;
clc;

load('D:\brainbnu\brain_software\ShareFolders\CHS_project\New\HMM_result\stress\k=10_2\tc.mat');

state = [1,2,3,4,5,6,7,8,9,10];
count = zeros(33,10);
check = zeros(1,10);
check2 = zeros(1,10);

for i = 1:33
    for j = 1:548
        for k =1:10
            if(tc(i,j) == state(k))
                count(i,k) = 1;
                break;
            end
        end
    end
end

save('D:\brainbnu\brain_software\ShareFolders\CHS_project\New\HMM_result\stress\k=10_2\count.mat','count');

check = sum(count);
save('D:\brainbnu\brain_software\ShareFolders\CHS_project\New\HMM_result\stress\k=10_2\check.mat','check');

for i = 1:10
    check2(i) = (33 - check(i))/33;
end
