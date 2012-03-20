function [ I_out ] = threshold( I, k )
%THRESHOLD Keep the k largest elements of I

I_out = zeros(size(I));
[sorted, indicies] = sort(abs(I(:)), 'descend');

for i = 1:k
     I_out(indicies(i)) = I(indicies(i));
end
end

