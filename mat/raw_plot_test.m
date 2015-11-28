% Test script of the 'raw_plot' function

filename = '../data/mat/S19_0.mat';
A = mat_read(filename);
raw_plot(A);

disp('raw_plot function OK');

