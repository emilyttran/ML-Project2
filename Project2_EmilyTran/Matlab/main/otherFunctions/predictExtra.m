function [predLabels,avgLowHigh] = predictExtra(model, newX, title)
% prediction function that outputs extra information: average, lowest, and
% highest value
predLabels = predict(model,newX);
avg = mean(predLabels);
high = max(predLabels);
low = min(predLabels);
avgLowHigh = [avg,low,high];

newTitle = strcat('Prediction with data of ',title);
disp(newTitle);
disp('[Avg, Low, High]');
disp(avgLowHigh);
end

