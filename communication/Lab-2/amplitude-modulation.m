pkg load communications;
pkg load signal;

f_sampling = 44100

t = 0:1/f_sampling:1

f_message = 10

f_carrier = 15000

carrier = sin(2* pi * f_carrier * t);

input = sin(2 * pi * f_message * t);

m = 0.5;

under_modulated_signal = (1 + m *input) .* carrier;

m= 1;

ideal_modulation = (1 + m *input).* carrier;

m = 1.01;

over_modulation = (1 + m *input) .* carrier;

%{
subplot(5, 1, 1);
plot(t, carrier);
title('Carrier Signal');

subplot(5, 1, 2);
plot(t, input);
title('Input message');
%}
fc = 2 * f_message; % Cutoff frequency for the filter (twice the message frequency)
fs = f_sampling;    % Sampling frequency

normalized_cutoff = fc / (fs / 2);

[num, den] = cheby1(5,2, normalized_cutoff);

demodulated_signal = filter(num, den, under_modulated_signal);
z=amdemod(ideal_modulation,f_carrier,f_sampling)
subplot(3, 1, 1);
plot(t, under_modulated_signal);
title('Under Modulation');

subplot(3, 1, 2);
plot(t, ideal_modulation);
title('Ideal Modulation');

subplot(3, 1, 3);
plot(t, z);
title('DeModulation');


