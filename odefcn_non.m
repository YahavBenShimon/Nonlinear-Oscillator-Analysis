function dydt = odefcn_non(t,y,zheta,omega_0,C,g_0,V_DC,V_AC,omega)
  alpha = C/((g_0^3)*(omega_0^2));
  omega_non = omega/omega_0;
  dydt = zeros(2,1);
  dydt(1) = y(2);
  dydt(2) = (alpha./(1-y(1)).^2).*(V_DC+V_AC.*sin(omega_non.*t)).^2 - 2*zheta*y(2) - y(1) ;
end