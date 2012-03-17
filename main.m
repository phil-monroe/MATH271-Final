clear; clc; close all

I = load_image('zebra-camo.jpg');


figure, imshow(I);

I_comp = im_compress(I, 5000, 'all');

figure, imshow(I_comp);

I_comp = im_compress(I, 5, 'block');

figure, imshow(I_comp);