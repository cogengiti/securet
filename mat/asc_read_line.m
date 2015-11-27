function [ A ] = asc_read_line( str )
%ASC_READ_LINE Read .asc file lines produced by the EyeLink
%   A = ASC_READ_LINE(STR) reads data from the file line named STR, and
%   returns sampled data.
%   
%   See also ASC_READ.
    
    % Read formatted data (opened eye) from string
    format = '%f\t  %f\t  %f\t %f\t...';
    [B, count, errmsg] = sscanf(str, format);
    if count == 4 && isempty(errmsg)
        A = B;
    else
        % Read formatted data (closed eye) from string
        format = '%f\t  .\t  .\t 0.0\t...';
        [C, count, errmsg] = sscanf(str, format);
        if count == 1 && isempty(errmsg)
            % Reconstruct data
            B = [C; NaN; NaN; 0.0];
            A = B;
        else
            % Display line and read error message
            disp(str);
            disp(errmsg);
            A = [];
        end
    end
    
end

