function [ file, ext, dir ] = parse_filename( name )
%PARSE_FILENAME Summary of this function goes here
%   Detailed explanation goes here

dirs = strfind(name, '/');
dot  = strfind(name, '.');
if length(dirs) > 0
    last_dir = dirs(length(dirs));
    dir     = name(1:last_dir-1);
else
    last_dir = 0;
end


file    = name(last_dir+1:dot-1);
ext     = name(dot+1:length(name));


end

