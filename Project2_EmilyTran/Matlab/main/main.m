load ('day.mat');

allX = day(:,1:11);
allY = day(:,12:14);
[testData, trainData, testInd, trainInd] = testTrainSplitter(allX,.10);
truthTrain = allY(trainInd,:);
truthTest = allY(testInd,:);
allLabString = ["Season","Year","Month","Holiday","Weekday","Working Day","Weather Situation","Temperature","ATemperature","Humidity","Windspeed"];
relevantCols = [1:7,9:11]; 

% pairwiseGraphAll(allX,allLabString);

best2FeaturesFinder(trainData,truthTrain(:,2),allLabString);
best3FeaturesFinder(trainData,truthTrain(:,2),allLabString);
best4FeaturesFinder(trainData,truthTrain(:,2),allLabString);
best5FeaturesFinder(trainData,truthTrain(:,2),allLabString);
best6FeaturesFinder(trainData,truthTrain(:,2),allLabString);
[bestFeat7,modelBest7] = best7FeaturesFinder(trainData,truthTrain(:,2),allLabString);
best8FeaturesFinder(trainData,truthTrain(:,2),allLabString);
best9FeaturesFinder(trainData,truthTrain(:,2),allLabString);
best10FeaturesFinder(trainData,truthTrain(:,2),allLabString);
best11FeaturesFinder(trainData,truthTrain(:,2),allLabString);


% Applying Ridge and Lasso to model
testLambda = [0,100,200,300,400];
[ridgeBetasAllFeats,rss1] = ridgeFn(trainData,truthTrain(:,2),testLambda,testData,truthTest(:,2));
[ridgeBetasRelevantFeats,rss2] = ridgeFn(trainData(:,relevantCols),truthTrain(:,2),testLambda,testData(:,relevantCols),truthTest(:,2));
[ridgeBetasBest7Feats,rss3] = ridgeFn(trainData(:,bestFeat7),truthTrain(:,2),testLambda,testData(:,bestFeat7),truthTest(:,2));

[lassoBetasAllFeats,rss4] = lassoFn(trainData,truthTrain(:,2),testLambda,testData,truthTest(:,2));
[lassoBetasRelevantFeats,rss5] = lassoFn(trainData(:,relevantCols),truthTrain(:,2),testLambda,testData(:,relevantCols),truthTest(:,2));
[lassoBetasBest7Feats,rss6] = lassoFn(trainData(:,bestFeat7),truthTrain(:,2),testLambda,testData(:,bestFeat7),truthTest(:,2));
ridgeError = [rss1;rss2;rss3];
lassoError = [rss4;rss5;rss6];

disp('RSS Error of using Ridge as lambda increases (from left to right)');
disp(ridgeError);  
disp('RSS Error of Using Lasso as lambda increases (from left to right)');
disp(lassoError);

% Create a separate test set for LA weather and predict
[predLATestSetSpringWeekend,SpringWeekendAvgLowHigh] = predictExtra(modelBest7,createData('spring','weekend',10000),' Spring/Weekend');
[predLATestSetSpringWeekday,SpringWeekdayAvgLowHigh] = predictExtra(modelBest7,createData('spring','weekday',10000),' Spring/Weekday');
[predLATestSetSummerWeekend,SummerWeekendAvgLowHigh] = predictExtra(modelBest7,createData('summer','weekend',10000),' Summer/Weekend');
[predLATestSetSummerWeekday,SummerWeekdayAvgLowHigh] = predictExtra(modelBest7,createData('summer','weekday',10000),' Summer/Weekday');
[predLATestSetWinterWeekend,WinterWeekendAvgLowHigh] = predictExtra(modelBest7,createData('winter','weekend',10000),' Winter/Weekend'); % I will be using fall and winter interchangeably since both season have similar average values
[predLATestSetWinterWeekday,WinterWeekdayAvgLowHigh] = predictExtra(modelBest7,createData('winter','weekday',10000),' Winter/Weekday');





