% Test script of the 'clean_data' function

name = 'S19_0';
filename = ['../data/mat/', name, '.mat'];
dir = '../out';
if not(exist(dir, 'dir'))
    mkdir(dir);
end

filename = ['../data/mat/', name, '.mat'];
A = mat_read(filename);
B = clean_data(A);
f = raw_plot(B);

filename = fullfile(dir, [name, '_clean_data_test.png']);
saveas(f, filename);

close(f);

disp('clean_data function OK');
