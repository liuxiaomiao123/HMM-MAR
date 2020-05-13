% written by liangying,7/2/2019

raw_dir = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/network/HMM/RS/stress/k=10_2/convert/';
imageOUT = cell(10,1);

for state = 1:10
     [AllVolume, VoxelSize, ImgFileList, Header, nVolumn] = rest_to4d('D:/brainbnu/brain_software/ShareFolders/CHS_project/ROI/Power_ROI/Power_264_3mm.nii');
     %save('D:/brainbnu/CHS_project/HMM/RS/stress/conversion/AllVolume.mat','AllVolume');
     %save('D:/brainbnu/CHS_project/HMM/RS/stress/conversion/Header.mat','Header');
     %save('D:/brainbnu/CHS_project/HMM/RS/stress/conversion/ImgFileList.mat','ImgFileList')
     %save('D:/brainbnu/CHS_project/HMM/RS/stress/conversion/nVolumn.mat','nVolumn')
     %save('D:/brainbnu/CHS_project/HMM/RS/stress/conversion/VoxelSize.mat','VoxelSize')

     load('D:/brainbnu/brain_software/ShareFolders/CHS_project/network/HMM/RS/stress/k=10_2/m2.mat');
     %load('D:/brainbnu/CHS_project/HMM/RS/stress/conversion/Header.mat');
     %load('D:/brainbnu/CHS_project/HMM/RS/stress/conversion/AllVolume.mat');
     
     % for ROInumber=1:11
     %      AllVolume(find(AllVolume==))= m(state,ROInumber)*100;
     % end
     
     AllVolume(find(AllVolume==61 | AllVolume==62 |AllVolume==63 |AllVolume==64 |AllVolume==65 | AllVolume==66 | AllVolume==67 | AllVolume==68 |AllVolume==69 | AllVolume==70 | AllVolume==71 | AllVolume==72 | AllVolume==73))= m(state,1)*100;
     AllVolume(find(AllVolume==251 | AllVolume==252 |AllVolume==256 |AllVolume==257 |AllVolume==258 | AllVolume==259 | AllVolume==260 | AllVolume==261 |AllVolume==262 | AllVolume==263 | AllVolume==264 ))= m(state,2)*100; 
     AllVolume(find(AllVolume==74 | AllVolume==75 |AllVolume==76 |AllVolume==77 |AllVolume==78 | AllVolume==79 | AllVolume==80 | AllVolume==81 |AllVolume==82 | AllVolume==83 | AllVolume==86 | AllVolume==87 | AllVolume==88| AllVolume==89| AllVolume==90| AllVolume==91| AllVolume==92| AllVolume==93| AllVolume==94| AllVolume==95| AllVolume==96| AllVolume==97| AllVolume==98| AllVolume==99| AllVolume==100| AllVolume==101| AllVolume==102| AllVolume==103| AllVolume==104| AllVolume==105| AllVolume==106| AllVolume==107| AllVolume==108| AllVolume==109| AllVolume==110| AllVolume==111| AllVolume==112| AllVolume==113| AllVolume==114| AllVolume==115| AllVolume==116| AllVolume==117| AllVolume==118| AllVolume==119| AllVolume==120| AllVolume==121| AllVolume==122| AllVolume==123| AllVolume==124| AllVolume==125| AllVolume==126| AllVolume==127| AllVolume==128| AllVolume==129| AllVolume==130| AllVolume==131| AllVolume==137| AllVolume==139))= m(state,3)*100;
     AllVolume(find(AllVolume==47 | AllVolume==48 |AllVolume==49 |AllVolume==50 |AllVolume==51 | AllVolume==52 | AllVolume==53 | AllVolume==54 |AllVolume==55 | AllVolume==56 | AllVolume==57| AllVolume==58| AllVolume==59| AllVolume==60 ))= m(state,4)*100; 
     AllVolume(find(AllVolume==174 | AllVolume==175 |AllVolume==176 |AllVolume==177 |AllVolume==178 | AllVolume==179 | AllVolume==180 | AllVolume==181 |AllVolume==186 | AllVolume==187 | AllVolume==188| AllVolume==189| AllVolume==190| AllVolume==191 | AllVolume==192 | AllVolume==193 | AllVolume==194 | AllVolume==195| AllVolume==196 | AllVolume==197| AllVolume==198| AllVolume==199| AllVolume==200| AllVolume==201| AllVolume==202 ))= m(state,5)*100; 
     AllVolume(find(AllVolume==13 | AllVolume==14 |AllVolume==15 |AllVolume==16 |AllVolume==17 | AllVolume==18 | AllVolume==19 | AllVolume==20 |AllVolume==21 | AllVolume==22 | AllVolume==23| AllVolume==24| AllVolume==25| AllVolume==26 | AllVolume==27 | AllVolume==28 | AllVolume==29 | AllVolume==30| AllVolume==31 | AllVolume==32| AllVolume==33| AllVolume==34| AllVolume==35| AllVolume==36| AllVolume==37| AllVolume==38| AllVolume==39| AllVolume==40| AllVolume==41| AllVolume==42| AllVolume==43| AllVolume==44| AllVolume==45| AllVolume==46| AllVolume==255 ))= m(state,6)*100; 
     AllVolume(find(AllVolume==203 | AllVolume==204 |AllVolume==205 |AllVolume==206 |AllVolume==207 | AllVolume==208 | AllVolume==209 | AllVolume==210 |AllVolume==211 | AllVolume==212 | AllVolume==213| AllVolume==214| AllVolume==215| AllVolume==216 | AllVolume==217 | AllVolume==218 | AllVolume==219 | AllVolume==220))= m(state,7)*100; 
     AllVolume(find(AllVolume==222 | AllVolume==223 |AllVolume==224 |AllVolume==225 |AllVolume==226 | AllVolume==227 | AllVolume==228 | AllVolume==229 |AllVolume==230 | AllVolume==231 | AllVolume==232| AllVolume==233| AllVolume==234))= m(state,8)*100; 
     AllVolume(find(AllVolume==1 | AllVolume==2 |AllVolume==3 |AllVolume==4 |AllVolume==5 | AllVolume==6 | AllVolume==7 | AllVolume==8 |AllVolume==9 | AllVolume==10 | AllVolume==11| AllVolume==12| AllVolume==84| AllVolume==85| AllVolume==132| AllVolume==133| AllVolume==134| AllVolume==135| AllVolume==136| AllVolume==140| AllVolume==141| AllVolume==142| AllVolume==182| AllVolume==183| AllVolume==184| AllVolume==185| AllVolume==221| AllVolume==243| AllVolume==244| AllVolume==245| AllVolume==246| AllVolume==247| AllVolume==248| AllVolume==249| AllVolume==250| AllVolume==253| AllVolume==254))= m(state,9)*100; 
     AllVolume(find(AllVolume==138 | AllVolume==235 |AllVolume==236 |AllVolume==237 |AllVolume==238 | AllVolume==239 | AllVolume==240 | AllVolume==241 |AllVolume==242))= m(state,10)*100; 
     AllVolume(find(AllVolume==143 | AllVolume==144 |AllVolume==145 |AllVolume==146 |AllVolume==147 | AllVolume==148 | AllVolume==149 | AllVolume==150 |AllVolume==151|AllVolume==152|AllVolume==153|AllVolume==154|AllVolume==155|AllVolume==156|AllVolume==157|AllVolume==158|AllVolume==159|AllVolume==160|AllVolume==161|AllVolume==162|AllVolume==163|AllVolume==164|AllVolume==165|AllVolume==166|AllVolume==167|AllVolume==168|AllVolume==169|AllVolume==170|AllVolume==171|AllVolume==172|AllVolume==173))= m(state,11)*100; 
     
      eval(['rootname = fullfile(raw_dir,''Mean',num2str(state),'.'')']); 
      extension = 'nii';   
      imageOUT{state} = [rootname,extension];
      rest_Write4DNIfTI(AllVolume,Header,imageOUT{state});
      clear('AllVolume');
end
      