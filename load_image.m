function I = load_image( file )
%LOAD_IMAGE opens a file from the current folder and returns the greyscale
% version.

I = rgb2gray(imread(file));
end

