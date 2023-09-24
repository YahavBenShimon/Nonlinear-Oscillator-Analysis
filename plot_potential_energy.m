function plot_potential_energy(C, omega_0, g_0, x_span)
    figure('Name', 'Potential');
    xlabel('$Static\ Deflection\ (m)$', 'Interpreter','latex');
    ylabel('$Potential\ Energy\ (J)$', 'Interpreter','latex');
    grid off;
    set(gca,'fontsize',16);
    legend('show');
    box on;
    for V_DC = 1 : 0.2 : 2
        hold on;
        U = (C * V_DC^2) ./ (x_span - g_0) + (omega_0^2 / 2) .* x_span.^2;
        plot(x_span, U, 'DisplayName', [num2str(V_DC),'[V]'], 'LineWidth', 1.5);
        xlim([0 2.8]);
        ylim([-3 3]);
    end
end