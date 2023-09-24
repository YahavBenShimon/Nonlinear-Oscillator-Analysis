clear all;
close all;
clc;

% Define your parameters
C = 1;                           % [(J*m)/(V^2*kg)]
V_DC = 2;                        % [V]
V_AC = 0.2;                      % [V]
V_step = 6;                      % [V]
omega_0 = 1;                     % [1/s]
zheta = 0.2;
g_0 = 3;                         % [m]

x_span = linspace(0, g_0, 1000);  % [m]

% Set ODE parameters
opts = odeset('RelTol', 1e-7, 'AbsTol', 1e-7);
t_span = [0 30];
IC = [0 0];

% Calculate critical voltage
V_cr = sqrt((4 * omega_0^2 * g_0^3) / (27 * C));

% Potential Energy Plot
plot_potential_energy(C, omega_0, g_0, x_span);

% Bifurcation Plot
plot_bifurcation_curve(C, omega_0, g_0);

% Effective Frequency Plot
plot_effective_frequency(C, g_0, omega_0, V_cr);

% Resonance Frequency Response Plot
omega_0 = 10;
V_cr = sqrt((4 * omega_0^2 * g_0^3) / (27 * C));
plot_resonance_curves(C, g_0, omega_0, V_cr, V_step, zheta, V_AC, t_span, IC, opts);

% Frequency Response Estimation Error Plot
plot_resonance_error(C, zheta, omega_0, g_0, IC, V_cr, V_step, V_AC, opts, t_span);

% Phase Space Plot
plot_phase_space(zheta, omega_0, C, g_0, IC, V_cr, V_step, V_AC, opts, t_span);

% Resonance Time Response Plot
plot_resonance_time(zheta, omega_0, C, g_0, IC, V_cr, V_AC, opts, t_span);

% PSD Plot
omega_0 = 20;
t_span = [0 100];
plot_PSD(zheta, omega_0, C, g_0, IC, V_DC, opts, t_span);
