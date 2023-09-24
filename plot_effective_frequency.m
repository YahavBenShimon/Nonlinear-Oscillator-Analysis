function plot_effective_frequency(C, g_0, omega_0, V_cr)
    % Function to calculate and plot the effective frequency vs. V_DC

    % Initialize the figure
    figure('Name', 'Effective Frequency')
    xlabel('$V_{DC}\ (V)$', 'Interpreter', 'latex')
    ylabel('$\omega_{Eff}\ (rad/s)$', 'Interpreter', 'latex')
    grid off
    set(gca, 'fontsize', 16)
    box on
    hold on

    % Calculation of omega_eff over V_DC range
    jj = 1;
    for V_DC = 1: 0.01 : V_cr     
        rots = roots([1 -2*g_0 g_0^2 -(C*V_DC^2)/omega_0^2]);
        x_st = rots(3);
        beta = (g_0-x_st);
        mu = x_st*beta^-1;
        omega_eff(jj) = (1-2*mu)*omega_0;
        jj = jj + 1;
    end

    % Plotting
    V_DC = 1: 0.01 : V_cr;
    plot(V_DC, omega_eff, 'LineWidth', 1.5)
end