function [indMax, line] = best8FeaturesFinder(input, output, labString)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
cell = {};
labelInd = [];
for i = 1:size(input,2)-7
    for j = (i+1):size(input,2)-6
        for k = (j+1):size(input,2)-5
            for l = (k+1):size(input,2)-4
                for m = (l+1):size(input,2)-3
                    for n = (m+1):size(input,2)-2
                        for o = (n+1):size(input,2)-1
                            for p = (o+1):size(input,2)
        X = [input(:,i),input(:,j),input(:,k),input(:,l),input(:,m),input(:,n),input(:,o),input(:,p)];
        model = fitlm(X,output);
        temp = {labString(i),labString(j),labString(k),labString(l),labString(m),labString(n),labString(o),labString(p),model.Rsquared.Adjusted};
        cell = [cell;temp];
        temp2 = [i,j,k,l,m,n,o,p];
        labelInd = [labelInd;temp2];
                            end
                        end
                    end
                end
            end
        end
    end
end


matrix = [cell{:,9}]';
[M,indMax] = max(matrix);
bestFeatureCols = labelInd(indMax,:);
bestFeatureColsReshape = reshape(bestFeatureCols,[size(bestFeatureCols,2),1]);
bestFeatureColsZero = [0;bestFeatureColsReshape];
line = cell(indMax,:);
disp('BEST 8 FEATURES');
disp(line);
modelBestSet = fitlm(input(:,bestFeatureCols),output);
CL = [bestFeatureColsZero,confidenceInterval95(modelBestSet)];
disp('Confidence levels for betas [beta#, confidence level]');
disp(CL);
disp('**********************************************************');
