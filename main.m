clear; clc; close all

figures_dir = 'figures';
image_dir   = 'images';


%% Load image
image_file = 'zebra-camo.jpg';
[img_name, img_ext] = parse_filename(image_file);
I = load_image(image_file);
[rows, cols] = size(I);
figure, imshow(I);

%% Run DCT
% DCT_script

%% Wavelet compress all
wname = 'haar';
level = 3;

step = 1000;
N_ks = floor(rows*cols/step);
errors = zeros(1, N_ks);

for i= 1:N_ks
    % Coefficients to keep
    k = i*step;
    
    % Compress and decompress
    [C, S] = wavedec2(I, level, wname);
    C_hat = threshold(C, k);
    I_rec = waverec2(C_hat, S, wname);
    
    % Save image
    fname = strcat(img_name, '_', wname, '_', int2str(k));
    imwrite(uint8(I_rec), filename(image_dir, fname, 'tiff'), 'tiff');
    
    % Save relative L2 error
    errors(i) = rel_error(I, I_rec);
end


%% Plot the results
h = figure;
plot(1:step:N_ks*step, errors);

% Save figure
fname = strcat(img_name, '_', wname);
print(h, '-depsc2', '-tiff', filename(figures_dir, fname, 'eps'));




