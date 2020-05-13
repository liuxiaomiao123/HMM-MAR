% written by Liangying, 7/20/2019 
clear;
clc;

[AllVolume1, VoxelSize1, ImgFileList1, Header1, nVolumn1] = rest_to4d('C:\Users\liuxiaomiao\Desktop\haiyang\RESULT\Network2\stress\ROI\DMN\DMN_z.nii');
%[AllVolume2, VoxelSize2, ImgFileList2, Header2, nVolumn2] = rest_to4d('C:\Users\liuxiaomiao\Desktop\haiyang\ANOVA\new\ghy\dlpfc\mask.nii');
%[AllVolume3, VoxelSize3, ImgFileList3, Header3, nVolumn3] = rest_to4d('D:/brainbnu/brain_software/ShareFolders/CHS_project/All/ROI/ips_association-test_z_FDR_0.01.nii');
%[AllVolume4, VoxelSize4, ImgFileList4, Header4, nVolumn4] = rest_to4d('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/ROI/test/angular gyrus_association-test_z_FDR_0.01.nii');
%[AllVolume5, VoxelSize5, ImgFileList5, Header5, nVolumn5] = rest_to4d('D:/brainbnu/brain_software/ShareFolders/CHS_project/All/ROI/5mm/sn_014_amygdala_R_26_-2_-20_5mm_roi.nii');
%[AllVolume6, VoxelSize6, ImgFileList6, Header6, nVolumn6] = rest_to4d('D:/brainbnu/brain_software/ShareFolders/CHS_project/All/ROI/5mm/dmn_006_hippocampus_R_28_-18_-16_5mm_roi.nii');
%[AllVolume7, VoxelSize7, ImgFileList7, Header7, nVolumn7] = rest_to4d('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/ROI/test/insula_association-test_z_FDR_0.01.nii');
%[AllVolume8, VoxelSize8, ImgFileList8, Header8, nVolumn8] = rest_to4d('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/ROI/test/dacc_association-test_z_FDR_0.01.nii');
%[AllVolume9, VoxelSize9, ImgFileList9, Header9, nVolumn9] = rest_to4d('D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/ROI/test/amygdala_hippocampus_wm.nii');

imageOUT_dir = 'C:\Users\liuxiaomiao\Desktop\haiyang\RESULT\Network2\stress\ROI\DMN\DMN_01.nii';
count = 0;
s = 0;

for x = 1:91
    for y = 1:109
        for z = 1:91
            if(AllVolume1(x,y,z) > 0 )
                AllVolume1(x,y,z) = 1
               % count=count+1;
               % x 
               % y
               % z
               % AllVolume2(x,y,z)
            end
            %if(AllVolume1(x,y,z) > 0 & AllVolume2(x,y,z) == 0)   %若球内的某个voxel在dorsal striatum没有，则证明这个voxel不属于striatum
            %    fprintf('Wrong!')
            %    s = s+1;
            %end
        end
    end
end

%count
%s

%for x = 1:91
%    for y = 1:109
%        for z = 1:91
%            if(AllVolume1(x,y,z) > 0 & AllVolume2(x,y,z) > 0)   
%                AllVolume2(x,y,z) = AllVolume1(x,y,z);
%            else
%                 AllVolume2(x,y,z) = 0;
%            end
%        end
%    end
%end


rest_Write4DNIfTI(AllVolume1,Header1,imageOUT_dir);

                