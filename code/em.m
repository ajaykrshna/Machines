
Vs = 220;  
Ra = 1; 
Rf = 200; 
Km = 0.1;
La = 0.01;
J = 0.001; 
B = 0.005; 
T_load = 1;
Lf = 0.01;

t_max = 10; 
dt = 0.001;

Ia = 0; 
w = 0;
If = 1;

t = 0:dt:t_max-dt;

Ia_data = zeros(size(t));
w_data = zeros(size(t));
Vs_data = Vs * ones(size(t));
If_data = zeros(size(t));

for i = 1:length(t)
  dIa_dt = (Vs - Ra*Ia - Km*w) / La;
  Ia = Ia + dIa_dt * dt;

  dw_dt = (Km*Ia - B*w - T_load) / J;
  w = w + dw_dt * dt;

  dIf_dt = (Vs - Rf*If) / Lf;
  If = If + dIf_dt * dt;

  Ia_data(i) = Ia;
  w_data(i) = w;
  If_data(i) = If;
end

figure(1);
plot(t, Vs_data, 'g', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Supply Voltage');
grid on;

figure(2);
plot(t, Ia_data, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Current (A)');
title('Armature Current');
grid on;

figure(3);
plot(t, w_data * (60/(2*pi)), 'r', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Speed (RPM)');
title('Speed');
grid on;

figure(4);
plot(t, If_data, 'm', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Current (A)');
title('Field Current');
grid on;
