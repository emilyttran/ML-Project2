function [indMax] = best4FeaturesFinder(input, output, labString)
% This function finds the best set of features based on the high R squared
% value
cell = {};
labelInd = [];
for i = 1:size(input,2)-3
    for j = (i+1):size(input,2)-2
        for k = (j+1):size(input,2)-1
            for l = (k+1):size(input,2)
        X = [input(:,i),input(:,j),input(:,k),input(:,l)];
        model = fitlm(X,output);
        temp = {labString(i),labString(j),labString(k),labString(l),model.Rsquared.Adjusted};
        cell = [cell;temp];
        temp2 = [i,j,k,l];
        labelInd = [labelInd;temp2];
            end
        end
    end
end


matrix = [cell{:,5}]';
[M,indMax] = max(matrix);
bestFeatureCols = labelInd(indMax,:);
bestFeatureColsReshape = reshape(bestFeatureCols,[size(bestFeatureCols,2),1]);
bestFeatureColsZero = [0;bestFeatureColsReshape];
line = cell(indMax,:);
disp('BEST 4 FEATURES [Last number is R-squared Adjusted]');
disp(line);
modelBestSet = fitlm(input(:,bestFeatureCols),output);
disp(modelBestSet);
CL = [bestFeatureColsZero,confidenceInterval95(modelBestSet)];
disp('Confidence levels for betas ');
disp('[col#, confidence level]');
disp(CL);
disp('**********************************************************');
