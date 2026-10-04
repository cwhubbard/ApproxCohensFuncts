function CohensDval = Cohens_95(g1Mean, g1L_95, g1U_95, N1, g2Mean, g2L_95, g2U_95, N2 )
%Cohens_95 calculates the cohen's d value when you are provided with a mean
%and 95% confidence interval rather than standard deviation. First converts
%the 95% confidence interval based on the lower ranges (g1L_95, g2L_95) and
%upper ranges (g1U_95, g2U_95), and N. Written by Cody W. Hubbard (2026)
%uncomment different comment zones if user has a preference

%uncomment here to here #1
sd1 = (sqrt(N1)*(g1U_95-g1L_95))/3.92;
%
 sd2 = (sqrt(N2)*(g2U_95-g2L_95))/3.92;
 %end uncomment

 %uncomment/comment here to here #2
% ConfInt = 0.95;
% alpha = 1-ConfInt;
% if N1 < 60 %using n < 60 based on cochrane handbook
%     ME1 = (g1U_95-g1L_95);%/2;
%     df1 = N1-1;
%     t_critVal1 = tinv(1-(alpha/2), df1)*2; %based on cochrane
%     %G1SE = ME1 / t_critVal1;
%     sd1  = (ME1 * sqrt(N1))/t_critVal1;
% else  %when larger states to use a normal distribution and this is what LLMs suggest
%     ME1 = (g1U_95-g1L_95);%/2;
%     zscore1 = norminv(1-(alpha/2))*2;
%     sd1 = (ME1 * sqrt(N1)) / zscore1;
% 
% end
% 
% if N2 < 60 
%     ME2 = (g2U_95-g2L_95);%/2;
%     df2 = N2-1;
%     t_critVal2 = tinv(1-(alpha/2), df2)*2;
%     %G2SE = ME2 / t_critVal2;
%     sd2  = (ME2 * sqrt(N2))/t_critVal2;
% else
%     ME2 = (g2U_95-g2L_95);%/2;
% 
%     zscore2 = norminv(1-(alpha/2))*2;
%     sd2 = (ME2 * sqrt(N2)) / zscore2;
% 
% end
%end uncomment #2



%uncomment/comment here to here #3
%ME1 = (g1U_95-g1L_95)/2;
%ME2 = (g2U_95-g2L_95)/2;
%df1 = N1-1;
%df2 = N2-1;
%ConfInt = 0.95;
%alpha = 1-ConfInt;
%t_critVal1 = tinv(1-alpha/2, df1);
%t_critVal2 = tinv(1-alpha/2, df2);

%sd1 = (ME1 * sqrt(N1)) / t_critVal1;
%sd2 = (ME2 * sqrt(N2)) / t_critVal2;
%end uncomment #3

if g1Mean >= g2Mean
        
        differ_in_groups = (g1Mean - g2Mean);
        
        pooledSD = sqrt(((N1-1)*sd1^2 +(N2-1)*sd2^2)/(N1+N2-2));
        
        CohensDval = differ_in_groups/pooledSD;

    elseif g1Mean < g2Mean
        
        differ_in_groups = (g2Mean - g1Mean);
        pooledSD = sqrt(((N2-1)*sd2^2 +(N1-1)*sd1^2)/(N2+N1-2));

        CohensDval = differ_in_groups/pooledSD;
end



end