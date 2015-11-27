function [  ] = raw_plot( A )
%RAW_PLOT Summary of this function goes here
%   Detailed explanation goes here
    
    figure('visible', 'off');
    plot(A(:, 2), A(:, 3));
    axis('equal');
    grid('on');
    title('Raw plot');
    xlabel('x');
    ylabel('y');
    
    filename = '../out/raw_plot_test.fig';
    saveas(gcf, filename);
    
    filename = '../out/raw_plot_test.png';
    saveas(gcf, filename);
    
end

