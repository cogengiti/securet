name = 'S15_0';
filename = ['../data/mat/', name, '.mat'];
dir = '../out';
if not(exist(dir, 'dir'))
    mkdir(dir);
end

options.f_s = 1000; % Hz
options.s_p = 5.0e-4; % m
options.d_s = 3.5e-2; % m
options.N = 2;
options.F = 21;
options.width = 1024; % px
options.height = 728; % px
options.v_u = 1000; % °/sec
options.a_u = 100000; % °/sec²
options.v_p = 200; % °/sec
options.ths = 1; % °/sec
options.alpha = 0.7;
options.beta = 0.3;

A = mat_read(filename);
%B = detect_event(A, options);
%%
addpath(fullfile(pwd, 'detect_event'));
%%
% 1. Filtering and denoising (remove unwanted variation in the eye
% movement data).
B = filter_event(A, options);
%%
C = compute_angular_velocity(B, options);
D = denoise_event(B, C, options);
B(D, :) = NaN;
C(D, :) = NaN;
%% 2. Peak saccade detection
[E, v_p, mu, sigma] = velocity_threshold_estimation(C(:, 2), options);
%% 3. Saccade onset/offset detection
[F, v_on] = detect_saccade_onset(E, C(:, 2), mu, sigma);
figure();
hold('on');
grid('on');
xlabel('time (msec)');
ylabel('velocity (deg/sec)');
plot(C(:, 2), 'k-');
plot(v_p * E, 'r-', 'LineWidth', 3);
plot(v_on * F, 'g-', 'LineWidth', 2);
%%
[mu_t, sigma_t, I] = detect_saccade(F, C(:, 2));
%%
[G, v_off] = detect_saccade_offset(I, C(:, 2), v_p, v_on, mu_t, sigma_t, options);
H = G';
V = [v_off; v_off];
stairs(H(:), V(:)' .* mod(1:length(H(:)), 2), 'b-', 'LineWidth', 1);

%%
figure();
hold('on');
grid('on');
xlabel('x');
ylabel('y');
[K, ~] = size(G);
for k = 1:K
    d = G(k, 1);
    f = G(k, 2);
    x = B(d:f, 1);
    x = x - x(1);
    y = B(d:f, 2);
    y = y - y(1);
    plot(x, y, 'b-');
end
%% 4. Glissade detection

% 5. Fixation detection


disp('detect_event function OK');

