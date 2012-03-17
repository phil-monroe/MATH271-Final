clear; clc; close all

I = load_image('zebra-camo.jpg');

[total, x_wins, y_wins] = num_subwindows(I);

for i = 0:x_wins
    for j = 0:y_wins
        for x = 1:8
            for y = 1:8
                if mod(i+j, 2)
                    I(i*8 + x, j*8 + y) = 0;
                else
                    I(i*8 + x, j*8 + y) = 255;
                end
            end
        end
    end
end

imshow(I)