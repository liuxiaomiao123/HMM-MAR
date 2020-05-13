% written by liangying, 1/12/2019
% the subjcet number in the edata.txt must match to the sub.txt
% type 11: 0 back / type 22: 2 back
% type 11：face / type 22：contol
% WM : 6 blocks,15 trials , durations = 27 （11year）
% WM : 17 trials （1516 year）
% EM ：5 blocks，6 trials , durations = 30
% Edata.txt format:id onset type
% if some subjects have different blocks and trials, this code can also adpat to it,
% just watch the length of onset array
% this code can also find the different trials(delete the % in the code)

clear;
clc;

edata_dir = 'D:\brainbnu\核对\control\Edata_onset\control_Edata_1516.txt'
subj_dir = 'D:\brainbnu\核对\control\Edata_onset\subj_Edata_1516.txt'   % attention!!! the subjcet number in the edata.txt must match to the sub.txt

trial = 17;  % need to change!!!
type1 = 11;
type2 = 22;

fid = fopen(edata_dir);
edata= textscan(fid,'%d %d %d');    
fclose(fid);
 
fid = fopen(subj_dir);
subj = textscan(fid, '%d');   
fclose(fid);

i = 1;   
j = 1;   
k = 1;
m = 1;
onset1 = [];
onset2 = [];
tmp1 = 0;
tmp2 = 0;
Flag1 = 0;
Flag2 = 0;                         

while(1)
   while(edata{1,1}(i) == subj{1,1}(j))  %edata{1,1} = edata{1}
        if(edata{1,3}(i) == type1)       %edata{1,3} = edata{3} 
            onset1(j,k) = edata{1,2}(i);
            if(onset1(j,k) - onset1(j,1) == 0 && Flag2 == 0)   
                tmp1 = onset1(j,1);
                Flag1 = 1;
            elseif(Flag2 == 1)
                tmp1 = tmp2;
            end
            onset1(j,k) = (onset1(j,k) - tmp1) / 1000;
            k = k + 1;
       %     if(edata{1,3}(i+trial) ~= type2 & edata{1,1}(i+trial) == edata{1,1}(i))
       %         fprintf('%d subject %dth trials type %d contains abnormal tirals!!!\n',subj{1,1}(j),i,edata{1,3}(i+trial));
               % break;
       %     end
            i = i + trial;
        elseif(edata{1,3}(i) == type2)
                onset2(j,m) = edata{1,2}(i);
                if(onset2(j,m) - onset2(j,1) == 0 && Flag1 ==0)   
                    tmp2 = onset2(j,1);
                    Flag2 = 1;
                elseif(Flag1 == 1)
                    tmp2 = tmp1;
                end
                onset2(j,m) = (onset2(j,m) - tmp2) / 1000;
                m = m + 1;              
              %  if(edata{1,3}(i+trial) ~= type1 & edata{1,1}(i+trial) == edata{1,1}(i))
              %         fprintf('%d subject %dth trials type %d contains abnormal tirals!!!\n',subj{1,1}(j),i,edata{1,3}(i+trial));
                     %  break;
              %  end
                i = i + trial;
            else
                i = i + 1;
        end;
        if(i >= length(edata{1,1}))
                 break;
        end;
   end;
j = j + 1;
Flag1 = 0;
Flag2 = 0;
k = 1;
m = 1;
  if(i >= length(edata{1,1}))
        break;
  end;
end

%subj_list = subj{1,2};
save('D:\brainbnu\核对\control\Edata_onset\onset_1516\onset1.mat','onset1');
save('D:\brainbnu\核对\control\Edata_onset\onset_1516\onset2.mat','onset2');
%save('D:\brainbnu\brain_software\ShareFolders\CHS_project\E-data\WM\subj_list.mat','subj_list');


