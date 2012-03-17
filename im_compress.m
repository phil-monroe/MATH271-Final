function [ I_out ] = im_compress( I_in, k, type )
%IM_COMPRESS compresses an image using the DCT

%% Initialize
I_out = zeros(size(I_in));

win_size = 8;
[total, x_wins, y_wins] = num_subwindows(I_in, win_size);

%% Perform the DCT transform
for i = 0:x_wins-1
    for j = 0:y_wins-1
        rows = i*win_size+1:i*win_size+win_size;
        cols = j*win_size+1:j*win_size+win_size;
        I_out(rows, cols) = dct2(I_in(rows, cols));
    end
end

%% Perform Thresholding
nz_before = nnz(I_out);
fprintf('Nonzero before:    %d\n', nz_before);

if strcmp(type, 'all')

    I_out = threshold(I_out, k);
elseif strcmp(type, 'block')
    for i = 0:x_wins-1
        for j = 0:y_wins-1
            rows = i*win_size+1:i*win_size+win_size;
            cols = j*win_size+1:j*win_size+win_size;
            I_out(rows, cols) = threshold(I_out(rows, cols), k);
        end
    end
end

nz_after = nnz(I_out);
fprintf('Nonzero after:     %d\n', nz_after);
fprintf('Compression Ratio: %f%% \n', nz_after/nz_before*100);
fprintf('Space Savings:     %f%% \n', (1-nz_after/nz_before)*100);

end

