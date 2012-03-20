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
DCT_script

%% Run Wavelet

