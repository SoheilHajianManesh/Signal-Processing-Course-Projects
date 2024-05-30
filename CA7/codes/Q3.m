syms y(t)
syms x(t)
sys = tf(1, 1);
Dy = diff(y);
ODE = diff(y, t, 2) + 3 * diff(y, t, 1) + 2 * y == 5 * step(sys);
c1 = (y(0) == 1);
c2 = (Dy(0) == 1);
y_solution(t) = dsolve(ODE, [c1, c2]);
y_simple = simplify(y_solution);
disp(y_simple);

figure;

tstart = 0;
tstep = 0.1;
tend = 10;
ts = tstart : tstep : tend;
y_values = double(y_simple(ts)); 
plot(ts, y_values);
grid on;
xlabel('Time');
ylabel('y(t)');
title('System Response');

