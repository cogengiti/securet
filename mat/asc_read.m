function [ A ] = asc_read( filename )
%ASC_READ Read .asc files produced by the EyeLink
%   A = ASC_READ(FILENAME) reads data from the file named FILENAME, and
%   returns sampled data A where rows correspond to samples and columns to
%   observation variables.
%   
%   See also MAT_READ, ASC2MAT, ASC_READ_LINE.
    
    % Read contents of file into string
    text = fileread(filename);
    % Split text at newline
    delimiter = '\n';
    B = strsplit(text, delimiter);
    % Apply asc_read_line function to each lines
    C = cellfun(@asc_read_line, B, 'UniformOutput', false);
    % Convert the contents of cell array into a single matrix
    A = cell2mat(C);
    % Transpose data matrix such that rows correspond to data samples
    A = transpose(A);
    
end

