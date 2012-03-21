clear; clc; close all

figures_dir = 'figures';
image_dir   = 'images';

wnames = strvcat('haar', 'db8', 'sym8', 'coif5');
labels = [];

% Reserve fig 1 for combined results
figure(1); 

%% Load image
image_file = 'zebra-camo.jpg';
[img_name, img_ext] = parse_filename(image_file);
I = load_image(image_file);
[rows, cols] = size(I);
% figure, imshow(I);

%% Run DCT
DCT_script

%% Wavelet compress all
for i=1:length(wnames(:,1))
    wname = strtrim(wnames(i,:))
    level = 3;
    wavelet_script
end

%% Clean up combined plot
legend(labels);
axis('tight')

% Save figure
fname = strcat(img_name, '_combined');
print(h, '-depsc2', '-tiff', filename(figures_dir, fname, 'eps'));

