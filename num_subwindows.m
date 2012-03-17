function [total, x_win, y_win] = num_subwindows( img, win_size )
%num_subwindows returns 
 if nargin < 2
    win_size = 8;
 end
  
  [rows, cols] = size(img);
  
  x_win = rows / win_size;
  y_win = cols / win_size;
  
  total = x_win*y_win;

end

