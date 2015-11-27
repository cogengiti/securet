function [ A ] = asc_read( filename )
%ASC_READ Read .asc files produced by the EyeLink
%   ASC_READ(FILENAME) reads data from the file named FILENAME, and returns
%   sampled data.
%   
%   See also ASC_READ_LINE.
    
    % Read contents of file into string
    text = fileread(filename);
    % Split text at newline
    delimiter = '\n';
    B = strsplit(text, delimiter);
    % Apply asc_read_line function to each lines
    C = cellfun(@asc_read_line, B, 'UniformOutput', false);
    % Convert the contents of cell array into a single matrix
    A = cell2mat(C);
    
end

