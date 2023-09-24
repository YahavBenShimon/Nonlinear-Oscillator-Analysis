function plot_resonance_curves(C, g_0, omega_0, V_cr, V_step, zheta, V_AC, t_span, IC, opts)

    % Different Voltage Asymptotic Plot
    figure('Name', 'Different Voltage');
    
    % Asymptotical subplot
    subplot(1, 2, 1);
    title('$Asymptotical$', 'Interpreter', 'latex');
    xlabel('$\omega\ (rad/s)$', 'Interpreter', 'latex');
    ylabel('$Amp.\ (m)$', 'Interpreter', 'latex');
    set(gca, 'fontsize', 16);
    grid off;
    box on;
    hold on;

    for V_DC = 1: V_cr/V_step: V_cr
        omega = 1: 0.5: 20;
        rots = roots([1 -2*g_0 g_0^2 -(C*V_DC^2)/omega_0^2]);
        x_st = rots(3);
        beta = (g_0-x_st);
        gamma = zheta * omega_0;
        eta = C^2 * beta^-4 * V_AC^2 * V_DC^2;
        mu = x_st * beta^-1;
        a = 2 * eta^0.5 ./ sqrt((2 * gamma .* omega).^2 + ((1 - 2 * mu) * omega_0^2 - omega.^2).^2);
        plot(omega, a, 'DisplayName', [num2str(V_DC), '[V]'], 'LineWidth', 1.5);
    end
    legend('show');

    % Numerical subplot
    subplot(1, 2, 2);
    title('$Numerical$', 'Interpreter', 'latex');
    xlabel('$\omega\ (rad/s)$', 'Interpreter', 'latex');
    ylabel('$Amp.\ (m)$', 'Interpreter', 'latex');
    set(gca, 'fontsize', 16);
    grid off;
    box on;
    hold on;

    for V_DC = 1: V_cr/V_step: V_cr
        jj = 1;
        for omega = 1: 0.5: 20
            sol = ode45(@(t, y) odefcn(t, y, zheta, omega_0, C, g_0, V_DC, V_AC, omega), t_span, IC, opts);
            Amp_vector(jj, 1) = 0.5 .* (max(sol.y(1, length(sol.y(1, :))/2 : end)) - min(sol.y(1, length(sol.y(1, :))/2 : end)));
            Amp_vector(jj, 2) = omega;
            jj = jj + 1;
        end
        plot(Amp_vector(:, 2), Amp_vector(:, 1), 'DisplayName', [num2str(V_DC), '[V]'], 'LineWidth', 1.5);
    end
    legend('show');
end