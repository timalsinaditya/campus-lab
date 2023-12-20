
pkg load signal

% Parameters for the square wave
frequency = 1;
amplitude = 5;
dc_bias = -3;
time_interval = [-3 3]; 

% Generate time vector
t = linspace(time_interval(1), time_interval(2), 1000);

% Fourier series approximation
m_values = [1, 5, 10, 20]; % Different values of m for the Fourier series

figure;
for i = 1:length(m_values)
    m = m_values(i);
    g_t = dc_bias;
    for n = 1:2:m*2
        g_t = g_t + (4 * amplitude / (n * pi)) * sin(2 * pi * n * frequency * t);
    end
    
    % Plotting
    subplot(length(m_values), 1, i);
    plot(t, g_t);
    title(sprintf('Fourier Series Approximation (m = %d)', m));
    xlabel('Time (seconds)');
    ylabel('Voltage (Volts)');
end

% Adjust figure size and spacing
set(gcf, 'Position', [100, 100, 800, 600]);
sgtitle('Approximation of Square Wave using Fourier Series');

