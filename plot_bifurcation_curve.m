function plot_bifurcation_curve(C, omega_0, g_0)
    ii = 1;
    for V_DC = 1 : 0.005 : 2.1
        rots = roots([1 -2*g_0 g_0^2 -(C * V_DC^2) / omega_0^2]);
        if isreal(rots(2)) && rots(2) < g_0
            unstable(ii) = rots(2);
            unstable_V(ii) = V_DC;
        end
        if isreal(rots(3)) && rots(3) < g_0
            stable(ii) = rots(3);
            stable_V(ii) = V_DC;
        end
        ii = ii + 1;
    end

    figure('Name', 'Biforcation Curve');
    xlabel('$V_{DC}\ (V)$', 'Interpreter','latex');
    ylabel('$Static\ Equilibrium\ (m)$', 'Interpreter','latex');
    grid off;
    set(gca,'fontsize',16);
    legend('show');
    box on;
    hold on;
    plot(unstable_V, unstable, '--', 'DisplayName', 'Unstable Equilibrium', 'LineWidth', 1.5);
    plot(stable_V, stable, 'DisplayName', 'Stable Equilibrium', 'LineWidth', 1.5);
end
