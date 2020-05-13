% written by liangying, 6/24/2019
clear;
clc;

repetitions = 1;
DirOut = 'D:/brainbnu/brain_software/ShareFolders/CHS_project/Final/HMM_result_9_7/k=10/k=10_1/';
N = 52;     % number of subjects
K = 10;     % number of states

for r = 1:repetitions
    figure(r)
    load([DirOut 'HMMrun_rep' num2str(r) '.mat']);
    m = zeros(hmm.K,17);  % need to change the number of ROIs
    FC = cell(hmm.K,1);
    for k = 1:hmm.K
        m(k,:) = getMean(hmm,k);
        FC{k} = getFuncConn(hmm,k);
    end
   save([DirOut 'm' num2str(r) '.mat'],'m');   
   save([DirOut 'FC' num2str(r) '.mat'],'FC');  
    
    % Some useful information about the dynamics
    maxFO = getMaxFractionalOccupancy(Gamma,T,options); % useful to diagnose if the HMM 
                                                        % is capturing dynamics or grand between-subject 
                                                        % differences (see Wiki)
    FO = getFractionalOccupancy (Gamma,T,options); % state fractional occupancies per session
    LifeTimes = getStateLifeTimes (vpath,T,options); % state life times
    Intervals = getStateIntervalTimes (vpath,T,options); % interval times between state visits
    SwitchingRate =  getSwitchingRate(Gamma,T,options); % rate of switching between stats
    
    save([DirOut 'maxFO' num2str(r) '.mat'],'maxFO');
    save([DirOut 'FO' num2str(r) '.mat'],'FO');
    save([DirOut 'LifeTimes' num2str(r) '.mat'],'LifeTimes'); 
    save([DirOut 'Intervals' num2str(r) '.mat'],'Intervals'); 
    save([DirOut 'SwitchingRate' num2str(r) '.mat'],'SwitchingRate'); 
    
    subplot(1,2,1) % Figure for state trainsition
    GammaSessMean = squeeze(mean(reshape(Gamma,[548 1 N K]),1));    
    GammaSubMean = squeeze(mean(GammaSessMean,1));
    [~,pca1] = pca(GammaSubMean','NumComponents',1);
    [~,ord] = sort(pca1); 
    imagesc(corr(GammaSubMean(:,ord))); colorbar
    subplot(1,2,2) 
    P = hmm.P;
    for j=1:K, P(j,j) = 0; P(j,:) = P(j,:) / sum(P(j,:));  end
    imagesc(P(ord,ord),[0 0.25]); colorbar
    axis square
    hold on
    for j=0:10
        plot([0 10] - 0.5,[j j] + 0.5,'k','LineWidth',2)
        plot([j j] + 0.5,[0 10] - 0.5,'k','LineWidth',2)
    end
    hold off
end


   