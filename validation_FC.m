% written by liangying,7/14/2019
clear;
clc;

raw_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC/' ;

num = 10;  % num = repetitions, 一共跑了多少次
K = 5;     % K表示一共有多少个states

for i=1:num
    eval(['rootname = fullfile(raw_dir,''FC',num2str(i),'.'')']); % 因为.mat文件导入后名字是W，所以修改文件名
    extension = 'mat';
    filename = [rootname,extension];
    load(filename);   % 导入到工作区后文件名都变成FC
    eval(['FC',num2str(i),'= ','FC',';']);
    variable = ['FC',num2str(i)];
    save(filename,variable);
end


file = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC';


for i=1:num
    for j=1:K
        eval(['fc','=','FC',num2str(i),'{',num2str(j),'}']);
        c(:,j) = fc([triu(fc)-diag(diag(fc))]~=0); 
    end
    eval(['root = fullfile(file,''cov',num2str(i),'.'')']);
    extension = 'mat';
    filename2 = [root,extension];
    save(filename2,'c');
end

load('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC/cov1.mat')
c1 = c;
load('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC/cov2.mat')
c2 = c;
load('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC/cov3.mat')
c3 = c;
load('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC/cov4.mat')
c4 = c;
load('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC/cov5.mat')
c5 = c;
load('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC/cov6.mat')
c6 = c;
load('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC/cov7.mat')
c7 = c;
load('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC/cov8.mat')
c8 = c;
load('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC/cov9.mat')
c9 = c;
load('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC/cov10.mat')
c10 = c;


Cov = [c1,c2,c3,c4,c5,c6,c7,c8,c9,c10];
corr = corrcoef(Cov);
save('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result/k=5/FC/corr.mat','corr');
        
  
   
