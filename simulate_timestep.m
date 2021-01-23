function current_state = simulate_timestep(current_state,command,gamma_1,gamma_2,k,t1)
 
[H,Ts,drone1_info, drone2_info,rate_consumo] = system_info;
    tspan = [0 Ts];



    my_ode = @(t,y) system_ode(t,y,command,gamma_1,gamma_2,k,t1);
    [~, y] = ode45(my_ode,tspan, current_state);
    
    if gamma_2==0
    current_state = [y(end,1), y(end,2),y(end,3),y(end,4),y(end,5),y(end,6),y(end,7),y(end,8),y(end,9),y(end,10),y(end,11),y(end,12),y(end,13)];
    end
 
     if gamma_2==1
    current_state = [y(end,1), y(end,2),y(end,3),y(end,4),y(end,5),y(end,6),y(end,7),y(end,8),y(end,9),y(end,10),y(end,11),y(end,12),y(end,13)];
    end
end