step = 1000;
N_ks = 30;
errors = zeros(1, N_ks);

for i= 1:N_ks
    fprintf('Compressing Image using %s wavelet by keeping %d coefficients\n', wname, k); 
    % Coefficients to keep
    k = i*step;
    
    % Compress and decompress
    [C, S] = wavedec2(I, level, wname);
    nz_before = nnz(C);
    C_hat = threshold(C, k);
    I_rec = waverec2(C_hat, S, wname);
    nz_after = nnz(C_hat);
    fprintf('Nonzero after:     %d\n', nz_after);
    fprintf('Compression Ratio: %f%% \n', nz_after/nz_before*100);
    fprintf('Space Savings:     %f%% \n\n', (1-nz_after/nz_before)*100);
    
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

% Plot to combined plot
h = figure(1);
hold all;
plot(1:step:N_ks*step, errors);
hold off;
labels = strvcat(labels, wname);