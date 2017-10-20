function [model] = regression(input,output)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
model = fitlm(input,output);
end

