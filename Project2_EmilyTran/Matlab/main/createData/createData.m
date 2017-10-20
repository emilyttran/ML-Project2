function [dataList] = createData(season, weekday, numberOfData)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
dataList = zeros(numberOfData,7);
%seasons, weathersituation, aTemp based in LA (ranges based on
%usclimatedata.com and weather-and-climate.com
for i = 1:numberOfData
    
    if(season == 'spring')
        s = 1;
        wthrsit = randi([1,2]);
        aT = unifrnd(11.7,22.7)/50;
        wnds = 4.2/67; 
    elseif(season == 'summer') 
        s = 2;
        wthrsit = 1;
        aT = unifrnd(14.7,25.9)/50;
        wnds = 4.2/67;
    elseif(season == 'winter')
        s = 4;
        wthrsit = randi([3,4]);
        aT = unifrnd(10.3,19.7)/50;
        wnds = 3.4/67;
    elseif(season == 'fall')
        s = 3;
        wthrsit = randi([2,3]);
        aT = unifrnd(10.4,24.1)/50;
        wnds = 3.4/67;
        
    end

    % year 
    yr = randi([0,1]);

    % weekday and workday
    if(weekday == 'weekday')
        weekd = randi([0,4]);
        workd = 1;
    elseif(weekday == 'weekend')
        weekd = randi([5,6]);
        workd = 0;
    elseif(weekday == 'random')
        weekd = randi([0,6]);
        if(weekd == 5 || 6)
            workd = 0;
        else
            workd = 1;
        end
    end

    schema = [s,yr,weekd,workd,wthrsit,aT,wnds];
    dataList(i,:) = schema;
end
end


