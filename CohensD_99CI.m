function [CohensDval] = CohensD_99CI(G1Mean,G1Upper, G1Lower, G1N, G2Mean, G2Upper, G2Lower, G2N)
%Hubbard 9/10/26 -- get the cohen's from mean and 99% CI
%if there is a formula users prefer then uncomment the different comment
%zones
%uncomment here to here #1
G1StDev = (sqrt(G1N)*(G1Upper-G1Lower)/5.15);
G2StDev = (sqrt(G2N)*(G2Upper-G2Lower)/5.15);
%end uncomment #1



%uncomment here to here #2
% ConfInt = 0.99;
% alpha = 1-ConfInt;
% if G1N < 60 %cochrane handbook states N less than 60
%     ME1 = (G1Upper-G1Lower);%/2;
%     df1 = G1N-1;
%     t_critVal1 = tinv(1-(alpha/2), df1)*2;
%     %G1SE = ME1 / t_critVal1;
%     G1StDev  = (ME1 * sqrt(G1N))/(t_critVal1);%sqrt(G1N) * (G1Upper-G1Lower)/(t_critVal1*2);%(ME1 * sqrt(G1N))/t_critVal1*2;
% else %when larger states to use a normal distribution and this is what LLMs suggest
%      ME1 = (G1Upper-G1Lower);%/2;
%      zscore1 = norminv(1-(alpha/2))*2;
%     G1StDev = (ME1 * sqrt(G1N)) / zscore1;
% 
% end
% 
% if G2N < 60
%     ME2 = (G2Upper-G2Lower);%/2;
%     df2 = G2N-1;
%     t_critVal2 = tinv(1-(alpha/2), df2)*2;
%    % G2SE = ME2 / t_critVal2;
%     %G2StDev  = sqrt(G2N) * (G2Upper-G2Lower)/(t_critVal2*2);
%      G2StDev  = (ME2 * sqrt(G2N))/(t_critVal2);
% else
%      ME2 = (G2Upper-G2Lower);%/2;
% 
%      zscore2 = norminv(1-(alpha/2))*2;
%      G2StDev = (ME2 * sqrt(G2N)) / zscore2;
% 
%  end
%end uncomment here #2


if G1Mean >= G2Mean

    differ_in_groups = (G1Mean - G2Mean);

    pooledSD = sqrt(((G1N-1)*G1StDev^2 +(G2N-1)*G2StDev^2)/(G1N+G2N-2));

    CohensDval = differ_in_groups/pooledSD;

elseif G1Mean < G2Mean

    differ_in_groups = (G2Mean - G1Mean);
    pooledSD = sqrt(((G2N-1)*G2StDev^2 +(G1N-1)*G1StDev^2)/(G2N+G1N-2));

    CohensDval = differ_in_groups/pooledSD;
end



end