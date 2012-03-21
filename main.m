%% Initialize
clear; clc; close all

figures_dir = 'figures';
image_dir   = 'images';

% files  = strvcat('zebra-camo.jpg', 'brickwork-texture.jpg', 'lenna.png', 'mandril.jpg', 'obama.jpg', 'ocean.jpeg', 'octocat.jpg', 'tux-cartoon.png', 'zebra-camo.jpg');
files  = strvcat('lenna.png');
wnames = strvcat('haar', 'db8', 'sym8', 'coif5');
labels = [];



for img=1:length(files(:,1))
    % Reserve fig 1 for combined results
    figure(1);
    image_file = strcat('test-images/', strtrim(files(img,:)));
    fprintf('Testing %s\n', image_file);
    compare_DCT2WT
    close all;
end