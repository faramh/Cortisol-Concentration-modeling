clear all; clc;
load("ImpulseInputImpulseResponseOutputMultiRateSystem.mat");
figure;
% Plot the input signal (u)
subplot(2, 1, 1);
plot(tu, u);
title('Input Signal (u)');
xlabel('Time');
ylabel('u');

% Plot the output signal (y)
subplot(2, 1, 2);
plot(ty, y);
title('Output Signal (y)');
xlabel('Time');
ylabel('y');
%% both signals should be in the same time domain

% Interpolate the input signal 'u' to match the output times 'ty'
u_interp = interp1(tu, u, ty, 'linear', 'extrap');
% Now 'u_interp' and 'y' are both aligned at the same time points 'ty'
u_interp=u_interp';


%% Convolution Matrix H
% Define the length of the input signal and output signal
n_u = length(u_interp);   % Length of input signal
n_y = length(y);          % Length of output signal

% Construct the convolution matrix (Toeplitz matrix) from u_interp
H = zeros(n_y, n_u);  % Initialize the convolution matrix

% Fill the convolution matrix with shifted versions of u
for i = 1:n_y
    for j = 1:min(i, n_u)
        H(i,j) = u_interp(i-j+1);  % Shifted version of u
    end
end


%% Regularized Least square
% Regularization parameter (choose a small value)
lambda = 1e-6;  % You can try different values of lambda

% Compute the regularized least squares solution
theta = (H' * H + lambda * eye(n_u)) \ (H' * y);
% Convolve the input signal with the estimated impulse response to get the estimated output
y_estimated = H * theta;

%% 
% Plot observed output and estimated output
figure;
hold on;
plot(ty, y, 'b', 'LineWidth', 1.5);         % Observed output (y)
plot(ty, y_estimated, 'r', 'LineWidth', 1.5); % Estimated output (y_estimated)
xlabel('Time');
ylabel('Output');
legend('Observed Output', 'Estimated Output');
title('Comparison of Observed and Estimated Output');
hold off;
%% 
% Display the first few estimated model parameters
disp('Estimated Model Parameters:');
disp(theta(1:10));  % Display first 10 values (adjust if you want more)










