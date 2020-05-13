clear;
clc;

DirOut = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result_9_7/k=5/k=5_1/';

r = 1;
load([DirOut 'FC' num2str(r) '.mat']);
K = 5;   % number of states
N = 17;   % number of ROIs
%tmp_fc = zeros(K,N*N);
tmp_fc = cell(K,1);
tmp_fc_reverse = zeros(N*N,K);
from = cell(N,K);
to = cell(N,K);
type = cell(N,K);

for i = 1:K
    FC_thr = threshold_proportional(FC{i}, 0.2);   % top 20% or top 30%
    for j = 1:N
        r = (j-1) * N + 1;
        s = j * N;
        tmp_fc{i}(1,r:s) = FC_thr(j,:);
    end   
end

for  i = 1:K
    tmp_fc_reverse(:,i) = tmp_fc{i};
    tmp_fc_reverse(:,i) = tmp_fc_reverse(:,i)';
end

for i = 1:N
    for j =1:N
        eval(['from{',num2str(j),',',num2str(i),'} = ''s',num2str(j),'''']);
        eval(['to{',num2str(j),',',num2str(i),'} = ''s',num2str(i),'''']);
        eval(['type{',num2str(j),',',num2str(i),'} = ''hyperlink','''']);
    end
end

from = reshape(from,[],1);
to = reshape(to,[],1);
type = reshape(type,[],1);

from = char(from);  % È¥µô×Ö·û´®µÄÒýºÅ
to = char(to);
type = char(type);
