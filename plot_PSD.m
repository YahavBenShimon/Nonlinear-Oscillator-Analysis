function plot_PSD(zheta, omega_0, C, g_0, IC, V_DC, opts, t_span)

    figure('Name', 'PSD')
    xlabel('$Frequency\ (Hz)$', 'Interpreter','latex')
    xlim([0 5])
    ylabel('$S_{xx}\ (A.U.)$', 'Interpreter','latex')
    grid off
    set(gca,'fontsize',16)
    legend('show')
    box on
    hold on
    omega = 0.5*omega_0;
     for V_AC = 1 : 1 : 4
        sol = ode45(@(t,y) odefcn(t,y,zheta,omega_0,C,g_0,V_DC,V_AC,omega),t_span,IC,opts);
        res=0.02;
        dt=sol.x(2);
        N=2^nextpow2(1/(res*dt));
        wind_length=N;
        [Amp,Frq] = pwelch(sol.y(1,:),hann(wind_length),[],[],1/sol.x(2));
        semilogy(Frq,Amp,'DisplayName',[num2str(V_AC),'[V]'],'LineWidth',1.5)
     end

end
