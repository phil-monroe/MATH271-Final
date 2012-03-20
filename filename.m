function [ file ] = filename( dir, name, ext )
%FILENAME Summary of this function goes here
%   Detailed explanation goes here

file = sprintf('%s/%s.%s', dir, name, ext);
end

