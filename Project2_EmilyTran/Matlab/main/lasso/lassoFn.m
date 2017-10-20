function [betas,rss] = lassoFn(input,output,lambda,testInput,testOutput)
% performs the lasso loss function on a dataset to create a model, and outputs an error using a
% test dataset
betas = lasso(input,output,'Lambda',lambda);
outputHat = testInput*betas;
rss = sum((testOutput-outputHat).^2);

