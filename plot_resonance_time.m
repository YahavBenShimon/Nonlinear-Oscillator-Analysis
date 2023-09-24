function plot_resonance_time(zheta, omega_0, C, g_0, IC, V_cr, V_AC, opts, t_span)

    % Initialization
    figure('Name', 'Resonance Time Plot')
    xlabel('$Time\ (s)$', 'Interpreter','latex')
    ylabel('$Amp.\ (m)$', 'Interpreter','latex')
    grid off
    set(gca,'fontsize',16)
    legend('show')
    box on
    hold on
    xlim([0 2.5])
    ylim([0 2.5])

    omega = omega_0;
    for V_DC = V_cr-1 :0.1 : V_cr
        sol = ode45(@(t,y) odefcn(t,y,zheta,omega_0,C,g_0,V_DC,V_AC,omega),t_span,IC,opts);
        plot(sol.x(:),sol.y(1,:),'DisplayName',[num2str(V_DC),'[V]'],'LineWidth',1.5)
    end

end
