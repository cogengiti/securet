function [ phi ] = pixel2visual_degree( s_p, d_s )
%PIXEL2VISUAL_DEGREE Summary of this function goes here
%   phi = PIXEL2VISUAL_DEGREE(s_p, d_s) converts from pixels to visual
%   degrees.
    
    phi = (180 / pi) * 2 * atan(s_p / (2 * d_s));
    
end

