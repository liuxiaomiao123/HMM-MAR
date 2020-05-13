% written by Liangying, 9/25/2019
% this script is for transferring 15/16 kaoyan's edata to standard format
% 0 back : type11
% 2 back : type22

clear;
clc;

edata_dir = 'D:\brainbnu\brain_software\ShareFolders\kaoyan\Edata\edata1516_raw.txt'

fid = fopen(edata_dir);
edata= textscan(fid,'%d %d %s');    
fclose(fid);
 
n = length(edata{1,1});
trial = 15;
edata_convert = cell(1,3);
k = 1;

for i = 1:n
    if(strcmp(edata{1,3}(i),'0-back'))
        for j = i+1 : i+trial
            edata{1,3}(j) = {11};
            edata_convert{1,1}(k) = edata{1,1}(j);
            edata_convert{1,2}(k) = edata{1,2}(j);
            edata_convert{1,3}(k) = edata{1,3}(j);
            k = k+1;
        end
        i = i + 2;
    elseif( strcmp(edata{1,3}(i),'1-back'))
        i = i + trial + 2;
        elseif( strcmp(edata{1,3}(i),'2-back'))
            for j = i+1 : i+trial
            edata{1,3}(j) = {22};
            edata_convert{1,1}(k) = edata{1,1}(j);
            edata_convert{1,2}(k) = edata{1,2}(j);
            edata_convert{1,3}(k) = edata{1,3}(j);
            k = k+1;
            end
            i = i + 2;
    end
end

sub = edata_convert{1,1};
sub = sub';

time = edata_convert{1,2};
time = time';

type = edata_convert{1,3};
type = cell2mat(type);
type = type';

edata_convert = [sub,time,type];






