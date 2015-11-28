function [ f ] = raw_plot( A )
%RAW_PLOT Raw plot
%   F = RAW_PLOT(A) plots vector Y of A versus vector X of A.
%   
%   See also PLOT.
    
    x = A(:, 2);
    y = A(:, 3);
    
    f = figure();
    hold('on');
    plot(x, y, 'b-');
    plot(x, y, 'b.');
    axis('equal');
    grid('on');
    box('on');
    xlabel('x');
    ylabel('y');
    
end

