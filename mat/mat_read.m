function [ A ] = mat_read( filename )
%MAT_READ Read .mat files produced by the EyeLink
%   A = MAT_READ(FILENAME) reads data from the file named FILENAME, and
%   returns sampled data A where rows correspond to samples and columns to
%   observation variables.
%   
%   See also ASC_READ.
    
    A = importdata(filename);
    
end

