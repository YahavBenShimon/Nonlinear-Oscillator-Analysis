function plot_phase_space_for_V_AC(C,zheta, omega_0, g_0, V_DC, t_span, IC, opts)
    figure('Name', 'Phase Space 2')
    xlabel('$x\ (m)$', 'Interpreter','latex')
    ylabel('$\dot{x} (m/s)$', 'Interpreter','latex')
    grid off
    set(gca,'fontsize',16)
    legend('show')
    box on
    hold on
    omega = 0.5*omega_0;
    for V_AC = 1 : 1 : 4
        sol = ode45(@(t,y) odefcn(t,y,zheta,omega_0,C,g_0,V_DC,V_AC,omega),t_span,IC,opts);
        plot(sol.y(1,0.5*length(sol.y):length(sol.y)),...
             sol.y(2,0.5*length(sol.y):length(sol.y)),...
             'DisplayName',[num2str(V_AC),'[V]'],'LineWidth',1.5);
    end
end
