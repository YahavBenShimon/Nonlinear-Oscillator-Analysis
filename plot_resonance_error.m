function plot_resonance_error(C, zheta, omega_0, g_0, IC, V_cr, V_step, V_AC, opts, t_span)

    % Initialization
    figure('Name', 'Diffrent Voltage Error')
    xlabel('$V_{DC}\ (V)$', 'Interpreter','latex')
    ylabel('$Error\ (\%)$', 'Interpreter','latex')
    grid off
    set(gca,'fontsize',16)
    legend('show')
    box on
    hold on

    jj = 1;
    for V_DC = 1: V_cr/V_step : V_cr
        sol = ode45(@(t,y) odefcn(t,y,zheta,omega_0,C,g_0,V_DC,V_AC,omega_0),t_span,IC,opts);
        rots = roots([1 -2*g_0 g_0^2 -(C*V_DC^2)/omega_0^2]);
        x_st = rots(3);
        beta = (g_0-x_st);
        gamma = zheta*omega_0;
        eta = C^2*beta^-4*V_AC^2*V_DC^2;
        mu = x_st*beta^-1;
        Amp_n = 0.5.*((max(sol.y(1,length(sol.y(1,:))/2:length(sol.y(1,:)))))-min(sol.y(1,length(sol.y(1,:))/2:length(sol.y(1,:)))));
        Amp_a = 2*eta^0.5./sqrt((2*gamma.*omega_0).^2+((1-2*mu)*omega_0^2-omega_0.^2).^2); 
        Error(jj,1) = V_DC;
        Error(jj,2) = 100.*abs(Amp_n-Amp_a)/Amp_n;
        jj = jj+1;
    end
    plot(Error(:,1),Error(:,2),'o','LineWidth',1.5)

end
