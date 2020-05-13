% written by Liangying,9/6/2019
% need to match the subject order in the onset.mat to the group order

load('D:\brainbnu\brain_software\ShareFolders\CHS_project\E-data\WM\onset1.mat'); % need to change, EM or WM tasks
load('D:\brainbnu\brain_software\ShareFolders\CHS_project\E-data\WM\onset2.mat');
% attention!!! the subject order in the onset.mat is from small to big, not
% corresponding to the stress and control group subject order
% need to match the E-data order to the brain data order for each subject

onset1 = round(onset1/2);   % TR ¡¢round
onset2 = round(onset2/2);
[r1,c1] = size(onset1);
[r2,c2] = size(onset2);
onset1_brain = zeros(r1,c1);
onset2_brain = zeros(r2,c2);

sub_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/E-data/sub_edata.txt' ; % the edata subject order
sub_group_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/E-data/sub_brain.txt';  % the brain subject order

fid = fopen(sub_group_dir);
brain_sub = textscan(fid, '%d');
fclose(fid);

fid = fopen(sub_dir);
edata_sub = textscan(fid, '%d');
fclose(fid);

N = length(brain_sub{1});
for i = 1:N
    for j = 1:N
        if(brain_sub{1}(j) == edata_sub{1}(i))
            onset1_brain(j,:) = onset1(i,:);
            onset2_brain(j,:) = onset2(i,:);
            break;
        end
    end
end

save('D:\brainbnu\brain_software\ShareFolders\CHS_project\E-data\WM\onset1_brain.mat','onset1_brain');
save('D:\brainbnu\brain_software\ShareFolders\CHS_project\E-data\WM\onset2_brain.mat','onset2_brain');




