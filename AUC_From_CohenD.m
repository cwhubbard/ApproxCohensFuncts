function AUCVal = AUC_From_CohenD(CohensD)
%Hubbard 9/10/26 get the area under the curve value from a Cohen's d effect
%size.

AUCVal = normcdf(CohensD/sqrt(2));


end