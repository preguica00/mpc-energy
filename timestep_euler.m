function x1 = timestep_euler(Ts,x0, u0,gamma_1,gamma_2,k,t1)
  
    x1 = x0 + Ts * system_ode(Ts,x0,u0,gamma_1,gamma_2,k,t1);
end
