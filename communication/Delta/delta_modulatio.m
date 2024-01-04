%create the message signal

freq = 5;
samp_freq = 1000;
t = 0:1/samp_freq:1;

m_t = 2 * exp(-t/4) .* cos(2 * freq * pi * t);

plot(t, y);
xlabel('Time');
ylabel('Function Value');

delta = 0.2;
f_delta = 500;
t_delta = 0:1/f_delta:1;

m_q = zeros(size(t_delta));
error_q = zeros(size(t_delta));

for i =1 : length(ts)-1
    error_q = sign()
