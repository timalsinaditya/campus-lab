function dydt = ode(t, y)
    dydt = 2 * cos(2 * t) - 4 * y;
endfunction

y0 = 0; 
tspan = [0 10];

[t, y] = ode23(@ode, tspan, y0);

plot(t, y)
title('Solution of dy/dt + 4y(t) = 2*cos(2t)')
xlabel('Time')
ylabel('y')
