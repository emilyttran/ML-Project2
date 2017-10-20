function [CL] = confidenceInterval95(model)
% find the 95% confidence interval for every coefficient in a model
CL = zeros(1);
    for i = 1:size(model.Coefficients,1)
        conLevelAnswer = (1.96*model.Coefficients{i,2})/sqrt(model.NumObservations);
        %disp(confidenceLevel);
        CL(i) = conLevelAnswer;
    end
  CL = reshape(CL,[size(CL,2),1]);
end

