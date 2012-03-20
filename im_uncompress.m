function [ I_out ] = im_uncompress( I_in )
%IM_UNCOMPRESS  Uncompresses an image using the inverse DCT

%% Initialize
I_out = zeros(size(I_in));

win_size = 8;
[total, x_wins, y_wins] = num_subwindows(I_in, win_size);

%% Perform the DCT transform
for i = 0:x_wins-1
    for j = 0:y_wins-1
        rows = i*win_size+1:i*win_size+win_size;
        cols = j*win_size+1:j*win_size+win_size;
        I_out(rows, cols) = idct2(I_in(rows, cols));
    end
end

end

