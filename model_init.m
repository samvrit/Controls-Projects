l = 1;  % m
m = 1;  % kg

x_init = 1;  % m
y_init = 3;  % m
theta_init = 20;  % deg
x_dot_init = 0.6;  % m/s
y_dot_init = -0.5;  % m/s
theta_dot_init = -20;  % deg/s

A = [zeros(3,3), eye(3); zeros(3,6)];
B = [0 0 0
     0 0 0
     0 0 0
     0 0 1/m
     1/m 0 0
     0 6/(m*l) 0];
C = eye(6);
D = zeros(6,3);

Q = diag([100 10000 1000 100 100000 1000]);
R = diag([10 100 100]);

[K, ~] = lqr(A, B, Q, R);

disp(K)
