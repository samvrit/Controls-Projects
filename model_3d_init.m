l = 1;  % m
m = 1;  % kg
rho = 1.24;  % kg/m^3
As = sqrt(0.001)*sqrt(0.001);
Cd = 0.45;

x_init = 0;  % m
y_init = 4;  % m
z_init = 0;  % m
theta_init = 5;  % deg
phi_init = 20;  % deg
x_dot_init = 0.6;  % m/s
y_dot_init = -0.5;  % m/s
z_dot_init = 0;  % m/s
theta_dot_init = -10;  % deg/s
phi_dot_init = 0;  % deg/s

A = [zeros(5,5), eye(5); zeros(5,10)];
A(7, 7) = (1/m)*rho*As*Cd;  % linearized drag force due to air resistance

B = [0 0 0 0 0
     0 0 0 0 0
     0 0 0 0 0
     0 0 0 0 0
     0 0 0 0 0
     0 0 0 1/m 0
     1/m 0 0 0 0
     0 0 0 0 1/m
     0 6/(m*l) 0 0 0
     0 0 6/(m*l) 0 0];
C = eye(10);
D = zeros(10,5);


Q = diag([100 10000 100 1000 1000 1000 100000 1000 1000 1000]);
R = diag([10 100 100 100 100]);

[K, ~] = lqr(A, B, Q, R);

disp(K)
