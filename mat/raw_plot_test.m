% Test script of the 'raw_plot' function

name = 'S19_0';
filename = ['../data/mat/', name, '.mat'];
A = mat_read(filename);
f = raw_plot(A);
title([regexprep(name, '_', '\\_'), ' raw plot test']);

dir = '../out';
if not(exist(dir, 'dir'))
    mkdir(dir);
end
filename = fullfile(dir, [name, '_raw_plot_test.png']);
saveas(f, filename);

close(f);

disp('raw_plot function OK');

