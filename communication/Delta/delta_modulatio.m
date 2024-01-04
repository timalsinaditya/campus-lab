freq = 5;
samp_freq = 1000;
t = 0:1/samp_freq:1;

m_t = 2 * exp(-t/4) .* cos(2 * freq * pi * t);

delta = 0.2;
f_delta = 500;
t_delta = 0:1/f_delta:1;
n = ((1:f_delta) *  (samp_freq / f_delta));

m_q = zeros(size(t_delta));
error_q = zeros(size(t_delta));

for i =1 : length(t_delta)-1
    error_q(i) = sign(m_t(n(i)) - m_q(i));
    m_q(i+1) = m_q(i);
    m_q(i+1) = m_q(i) + delta * error_q(i);
end

subplot(2,1,1);
plot(t, m_t);
hold on;

stairs(t_delta, m_q);
hold off;

subplot(2,1,2);
stairs(t_delta, error_q);
