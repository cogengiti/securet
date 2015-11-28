% Test script of the 'clean_data' function

filename = '../data/mat/S19_0.mat';
A = mat_read(filename);
B = clean_data(A);
raw_plot(B);

disp('clean_data function OK');
