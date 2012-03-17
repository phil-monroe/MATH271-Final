function [ I_out ] = threshold( I, k )
%THRESHOLD Keep the k largest elements of I

    sorted = sort(I(:), 'descend');
    thresh = sorted(k+1);

    I_out = wthresh(I, 'h', thresh);


end

