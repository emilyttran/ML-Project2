function [] = pairwiseGraphAll(input,labString)
% graphs every pair of a feature set with each other
for i = 1:(size(input,2)-1)
    for j = (i+1):size(input,2)
        figure();
        scatter(input(:,i),input(:,j));
        xlabel(labString(i));
        ylabel(labString(j));
    end
end

end

