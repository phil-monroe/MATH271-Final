clear; clc; close all

%% Load image
I = load_image('zebra-camo.jpg');
figure, imshow(I);


%% DCT Compress all
I_comp = im_compress(I, 10000, 'all');
figure, imshow(I_comp);

I_rec = im_uncompress(I);
figure, imshow(I_rec);


%% DCT Compress block
I_comp = im_compress(I, 25, 'block');
figure, imshow(I_comp);

I_rec = im_uncompress(I);
figure, imshow(I_rec);