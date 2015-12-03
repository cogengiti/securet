% Test script of the 'detect_blink' function

name = 'S19_0';
filename = ['../data/mat/', name, '.mat'];
dir = '../out';
if not(exist(dir, 'dir'))
    mkdir(dir);
end

A = mat_read(filename);
B = detect_blink(A);

B_1 = B(B(:, 3) == 1, 2);
M = max(B_1);
f_1 = figure();
hist(B_1, M);
grid('on');
title('Opened eye');
xlabel('number of samples');
ylabel('number of paths');

filename = fullfile(dir, [name, '_detect_blink_open_test.png']);
saveas(f_1, filename);

close(f_1);

B_2 = B(B(:, 3) == 0, 2);
M = max(B_2);
f_2 = figure();
hist(B_2, M);
grid('on');
title('Closed eye');
xlabel('number of samples');
ylabel('number of paths');

filename = fullfile(dir, [name, '_detect_blink_close_test.png']);
saveas(f_2, filename);

close(f_2);

disp('detect_blink function OK');
