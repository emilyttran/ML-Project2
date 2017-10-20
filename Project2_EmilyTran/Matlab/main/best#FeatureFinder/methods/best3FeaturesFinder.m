function [indMax] = best3FeaturesFinder(input, output, labString)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
cell = {};
labelInd = [];
for i = 1:size(input,2)-2
    for j = (i+1):size(input,2)-1
        for k = (j+1):size(input,2)
        X = [input(:,i),input(:,j),input(:,k)];
        model = fitlm(X,output);
        temp = {labString(i),labString(j),labString(k),model.Rsquared.Adjusted};
        cell = [cell;temp];
        temp2 = [i,j,k];
        labelInd = [labelInd;temp2];
        end
    end
end


matrix = [cell{:,4}]';
[M,indMax] = max(matrix);
bestFeatureCols = labelInd(indMax,:);
bestFeatureColsReshape = reshape(bestFeatureCols,[size(bestFeatureCols,2),1]);
bestFeatureColsZero = [0;bestFeatureColsReshape];
line = cell(indMax,:);
disp('BEST 3 FEATURES');
disp(line);
modelBestSet = fitlm(input(:,bestFeatureCols),output);
disp(modelBestSet);
CL = [bestFeatureColsZero,confidenceInterval95(modelBestSet)];
disp('Confidence levels for betas');
disp('[col#, confidence level]');
disp(CL);
disp('**********************************************************');
