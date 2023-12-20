pkg load control

% Define numerator and denominator coefficients of the transfer function
num = [1];
den = [1, 2, 1]; % Represents s^2 + 2s + 1

% Create a transfer function using the coefficients
sys = tf(num, den);

% Get numerator and denominator coefficients separately
[num_coeffs, den_coeffs] = tfdata(sys, 'v');

% Construct the transfer function expression for display
num_str = poly2str(num_coeffs, 's');
den_str = poly2str(den_coeffs, 's');

tf_str = ['Transfer Function: ', num_str, ' / ', den_str];
disp(tf_str);
pkg load control

% Define numerator and denominator coefficients of the transfer function
num = [1];
den = [1, 2, 1]; % Represents s^2 + 2s + 1

% Create a transfer function using the coefficients
sys = tf(num, den);

% Get numerator and denominator coefficients separately
[num_coeffs, den_coeffs] = tfdata(sys, 'v');

% Construct the transfer function expression for display
num_str = poly2str(num_coeffs, 's');
den_str = poly2str(den_coeffs, 's');

tf_str = ['Transfer Function: ', num_str, ' / ', den_str];
disp(tf_str);

