function dydt = odefcn(t,y,zheta,omega_0,C,g_0,V_DC,V_AC,omega)
  dydt = zeros(2,1);
  dydt(1) = y(2);
  dydt(2) = (C./(g_0-y(1)).^2).*(V_DC+V_AC.*sin(omega.*t)).^2 - 2*zheta*omega_0*y(2) -(omega_0^2)*y(1) ;
end