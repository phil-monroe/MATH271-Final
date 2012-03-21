%% DCT Compress all
step = 1000;
N_ks = floor(rows*cols/step);
errors = zeros(1, N_ks);


for i= 1:N_ks
    % Coefficients
    k = i*step;
    
    % Compress and decompress
    I_comp_all = im_compress(I, k, 'all');
    I_rec_all = im_uncompress(I_comp_all);
    
    % Save image
    fname = strcat(img_name, '_', 'DCT_compress_all', '_', int2str(k));
    imwrite(uint8(I_rec_all), filename(image_dir, fname, 'tiff'), 'tiff');
    
    % Save relative L2 error
    errors(i) = rel_error(I, I_rec_all);
end

%% Plot the results
h = figure;
plot(1:step:N_ks*step, errors);

% Save figure
fname = strcat(img_name, '_', 'DCT_compress_all');
print(h, '-depsc2', '-tiff', filename(figures_dir, fname, 'eps'));

% Plot to combined plot
h = figure(1);
hold all;
plot(1:step:N_ks*step, errors);
hold off;
labels = strvcat(labels, 'DCT All');


%% DCT Compress Blocks
N_ks = 63;
errors = zeros(1, N_ks);

for i= 1:N_ks
    % Coefficients
    k = i;
    
    % Compress and decompress
    I_comp_all = im_compress(I, k, 'block');
    I_rec_all = im_uncompress(I_comp_all);
    
    % Save Image
    % Save image
    fname = strcat(img_name, '_', 'DCT_compress_block', '_', int2str(k));
    imwrite(uint8(I_rec_all), filename(image_dir, fname, 'tiff'), 'tiff');
    
    % Save relative L2 error
    errors(i) = rel_error(I, I_rec_all);
end

%% Plot the results

h = figure;
plot(1:N_ks, errors);
% Save figure
fname = strcat(img_name, '_', 'DCT_compress_blocks');
print(h, '-depsc2', '-tiff', filename(figures_dir, fname, 'eps'))

% Plot to combined plot
% h = figure(1);
% hold on;
% plot(1:step:N_ks*step, errors);
% hold off;
% labels = strvcat(labels, 'DCT Block');