function [betas,rss] = ridgeFn(input, output, lambda, testInput, testOutput)
% performs the ridge loss function on a dataset to create a model, and outputs an error using a
% test dataset
betas = ridge(output,input,lambda,0);

colZeros = ones(size(testInput,1),1);
testWithColZeros = [colZeros,testInput];
outputHat = testWithColZeros*betas;
rss = sum((testOutput-outputHat).^2);
end

