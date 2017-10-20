function [indMax] = best2FeaturesFinder(input, output, labString)
% This function finds the best set of features based on the high R squared
% value
cell = {};
labelInd = [];
for i = 1:size(input,2)-1
    for j = (i+1):size(input,2)
        X = [input(:,i),input(:,j)];
        model = fitlm(X,output);
        temp = {labString(i),labString(j),model.Rsquared.Adjusted};
        cell = [cell;temp];
        temp2 = [i,j];
        labelInd = [labelInd;temp2];
    end
end


matrix = [cell{:,3}]';
[M,indMax] = max(matrix);
bestFeatureCols = labelInd(indMax,:);
bestFeatureColsReshape = reshape(bestFeatureCols,[size(bestFeatureCols,2),1]);
bestFeatureColsZero = [0;bestFeatureColsReshape];
line = cell(indMax,:);
disp('BEST 2 FEATURES [Last number is R-squared Adjusted]');
disp(line);
modelBestSet = fitlm(input(:,bestFeatureCols),output);
disp(modelBestSet);
CL = [bestFeatureColsZero,confidenceInterval95(modelBestSet)];
disp('Confidence levels for betas ');
disp('[col#, confidence level]');
disp(CL);
disp('**********************************************************');
