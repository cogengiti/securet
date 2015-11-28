% Test script of the 'detect_blink' function

filename = '../data/mat/S19_0.mat';
A = mat_read(filename);
B = detect_blink(A);

B_1 = B(B(:, 3) == 1, 2);
M = max(B_1);
figure();
hist(B_1, M);
grid('on');
title('Opened eye');
xlabel('number of samples');
ylabel('number of paths');

B_2 = B(B(:, 3) == 0, 2);
M = max(B_2);
figure();
hist(B_2, M);
grid('on');
title('Closed eye');
xlabel('number of samples');
ylabel('number of paths');

disp('detect_blink function OK');
