function [ testData, trainData, testInd, trainInd ] = testTrainSplitter( fullDataSet, percentOfTestSet )
%a function that splits a dataset index-wise into test and training set

%   initialization
    sizeOfData = size(fullDataSet,1);
    dataIndex = reshape(1:sizeOfData,[sizeOfData,1]);
    sizeOfTest = round(size(fullDataSet,1)*percentOfTestSet);
    
    %find test indices
    rand = randperm(sizeOfData,sizeOfTest);
    testInd = reshape(rand,[sizeOfTest,1]);
    
    %find train indices
    leftovers = ~ismember(dataIndex,rand);
    trainInd = find(leftovers); 
    
    testData = fullDataSet(testInd,:);
    trainData = fullDataSet(trainInd,:);
end