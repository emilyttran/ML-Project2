function [bestFeatureCols, modelBestSet] = best7FeaturesFinder(input, output, labString)
% This function finds the best set of features based on the high R squared
% value
cell = {};
labelInd = [];
for i = 1:size(input,2)-6
    for j = (i+1):size(input,2)-5
        for k = (j+1):size(input,2)-4
            for l = (k+1):size(input,2)-3
                for m = (l+1):size(input,2)-2
                    for n = (m+1):size(input,2)-1
                        for o = (n+1):size(input,2)
        X = [input(:,i),input(:,j),input(:,k),input(:,l),input(:,m),input(:,n),input(:,o)];
        model = fitlm(X,output);
        temp = {labString(i),labString(j),labString(k),labString(l),labString(m),labString(n),labString(o),model.Rsquared.Adjusted};
        cell = [cell;temp];
        temp2 = [i,j,k,l,m,n,o];
        labelInd = [labelInd;temp2];
                        end
                    end
                end
            end
        end
    end
end



matrix = [cell{:,8}]';
[M,indMax] = max(matrix);
bestFeatureCols = labelInd(indMax,:);
bestFeatureColsReshape = reshape(bestFeatureCols,[size(bestFeatureCols,2),1]);
bestFeatureColsZero = [0;bestFeatureColsReshape];
line = cell(indMax,:);
disp('BEST 7 FEATURES [Last number is R-squared Adjusted');
disp(line);
modelBestSet = fitlm(input(:,bestFeatureCols),output);
figure('Name','Best 7 Features');
plotResiduals(modelBestSet,'fitted');
disp(modelBestSet);
% disp(bestFeatureCols);
CL = [bestFeatureColsZero,confidenceInterval95(modelBestSet)];
disp('Confidence levels for betas ');
disp('[col#, confidence level]');
disp(CL);
disp('**********************************************************');











