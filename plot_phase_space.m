function plot_phase_space(zheta, omega_0, C, g_0, IC, V_cr, V_step, V_AC, opts, t_span)

    % Initialization
    figure('Name', 'Phase Space')
    xlabel('$x\ (m)$', 'Interpreter','latex')
    ylabel('$\dot{x} (m/s)$', 'Interpreter','latex')
    grid off
    set(gca,'fontsize',16)
    legend('show')
    box on
    hold on

    omega = omega_0;
    for V_DC = 1 :V_cr/V_step : V_cr
        sol = ode45(@(t,y) odefcn(t,y,zheta,omega_0,C,g_0,V_DC,V_AC,omega),t_span,IC,opts);
        plot(sol.y(1,:),sol.y(2,:),'DisplayName',[num2str(V_DC),'[V]'],'LineWidth',1.5)
    end
    plot(0,0,'*','DisplayName','I.C','LineWidth',3)

end