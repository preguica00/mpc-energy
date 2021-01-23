  function  [command, optimum, predicted_trajectory,costt,costt_energy] = optimizetrajectory(current_state, optimum,k,gamma_1,gamma_2,t1)


%% Initial conditions 
    
    if gamma_2==0
    % drone 1
    x_init_d1 = current_state(1);
    y_init_d1 = current_state(2);
    z_init_d1 = current_state(3);
    dotx_init_d1 = current_state(4);
    doty_init_d1 = current_state(5);
    dotz_init_d1 = current_state(6);

    phi_init_d1 = current_state(7);
    theta_init_d1 = current_state(8);
    yaw_init_d1 = current_state(9);

    wx_init_d1 = current_state(10);
    wy_init_d1 = current_state(11);
    wz_init_d1 = current_state(12);
    E1_init_d1 = current_state(13);
    
    init_vector_d1 = [x_init_d1;y_init_d1;z_init_d1;dotx_init_d1;doty_init_d1;dotz_init_d1;phi_init_d1; theta_init_d1; yaw_init_d1; wx_init_d1;wy_init_d1;wz_init_d1];    
    init_vector = [init_vector_d1;E1_init_d1];
    

    end
    
    if gamma_2==1
        
    % drone 2
    x_init_d2 = current_state(1);
    y_init_d2 = current_state(2);
    z_init_d2 = current_state(3);
    dotx_init_d2 = current_state(4);
    doty_init_d2 = current_state(5);
    dotz_init_d2 = current_state(6);
    phi_init_d2 = current_state(7);
    theta_init_d2 = current_state(8);
    yaw_init_d2 = current_state(9);
    wx_init_d2 = current_state(10);
    wy_init_d2 = current_state(11);
    wz_init_d2 = current_state(12);
    Edrone2_init = current_state(13);

    init_vector_d2 = [x_init_d2;y_init_d2;z_init_d2;dotx_init_d2;doty_init_d2;dotz_init_d2;phi_init_d2; theta_init_d2; yaw_init_d2; wx_init_d2;wy_init_d2;wz_init_d2];
    init_vector =  [init_vector_d2;Edrone2_init];
    
    end
    
   
  %% optimizer
  
  [H,Ts,drone1_info, drone2_info,rate_consumo] = system_info;
     
    %initial conditions
    if isempty(optimum)
        optimum = [10*ones(H,1);zeros(6*H,1);1.8*ones(2*H,1);zeros(8*H,1)];
    end

    opts = optimoptions('fmincon','Algorithm','sqp','TolFun',0.001,'MaxIter',100000,'MaxFunEvals',100000);

    lb=[];
    ub=[];
    
    [optimum, ~] = fmincon(@(y)costfunction(y, H,k,gamma_1,gamma_2), optimum,[],[],[],[],lb,ub,@(y)discretization(y,init_vector,gamma_1,gamma_2,k,t1),opts);
 
    
      [costt,costt_energy]= costfunction(optimum, H,k,gamma_1,gamma_2);
  
  if gamma_2==0
      
      
      % drone 1
      id1_T1 = drone1_info(1,:);
      id1_taux1 = drone1_info(2,:);
      id1_tauy1 = drone1_info(3,:);
      id1_tauz1 = drone1_info(4,:);
      
      id1_x1= drone1_info(5,:);
      id1_y1 = drone1_info(6,:);
      id1_z1= drone1_info(7,:);
      id1_dotx1= drone1_info(8,:);
      id1_doty1 = drone1_info(9,:);
      id1_dotz1= drone1_info(10,:);
      
      id1_phi1 = drone1_info(11,:);
      id1_theta1 = drone1_info(12,:);
      id1_yaw1 = drone1_info(13,:);
      
      id1_wx1 = drone1_info(14,:);
      id1_wy1 = drone1_info(15,:);
      id1_wz1 = drone1_info(16,:);
      
      %Energy
      id_Edrone1 = rate_consumo(1,:);
      
      %% optimal control
      % drone 1
      T1_opt  = optimum(id1_T1);
      tau_x1_opt  = optimum(id1_taux1);
      tau_y1_opt  = optimum(id1_tauy1);
      tau_z1_opt  = optimum(id1_tauz1);
      
      
      x1_opt  = optimum(id1_x1);
      y1_opt  = optimum(id1_y1);
      z1_opt  = optimum(id1_z1);
      dotx1_opt  = optimum(id1_dotx1);
      doty1_opt  = optimum(id1_doty1);
      dotz1_opt  = optimum(id1_dotz1);
      
      phi_d1_opt  = optimum(id1_phi1);
      theta_d1_opt  = optimum(id1_theta1);
      yaw_d1_opt  = optimum(id1_yaw1);
      wx_d1_opt  = optimum(id1_wx1);
      wy_d1_opt  = optimum(id1_wy1);
      wz_d1_opt  = optimum(id1_wz1);
      % Energy rate
      Edrone1_opt  = optimum(id_Edrone1);
    
      command=[T1_opt(1), tau_x1_opt(1),tau_y1_opt(1), tau_z1_opt(1)];
      
      predicted_d1=[x1_opt,y1_opt,z1_opt,dotx1_opt,doty1_opt,dotz1_opt,phi_d1_opt,theta_d1_opt,yaw_d1_opt,wx_d1_opt,wy_d1_opt,wz_d1_opt];
      predicted_trajectory = [predicted_d1,Edrone1_opt];
      
   
   end
   
   if gamma_2==1
       
%        drone 2
       id2_T2 = drone2_info(1,:);
       id2_taux2 = drone2_info(2,:);
       id2_tauy2 = drone2_info(3,:);
       id2_tauz2 = drone2_info(4,:);
       
       id2_x2= drone2_info(5,:);
       id2_y2 = drone2_info(6,:);
       id2_z2= drone2_info(7,:);
       id2_dotx2= drone2_info(8,:);
       id2_doty2 = drone2_info(9,:);
       id2_dotz2= drone2_info(10,:);
       
       id2_phi2 = drone2_info(11,:);
       id2_theta2 = drone2_info(12,:);
       id2_yaw2 = drone2_info(13,:);
       id2_wx2 = drone2_info(14,:);
       id2_wy2 = drone2_info(15,:);
       id2_wz2 = drone2_info(16,:);
       
       %        Energy
       id_Edrone2 = rate_consumo(2,:);

       %%
%        drone 2
       T2_opt = optimum(id2_T2);
       tau_x2_opt  = optimum(id2_taux2);
       tau_y2_opt  = optimum(id2_tauy2);
       tau_z2_opt  = optimum(id2_tauz2);
       x2_opt  = optimum(id2_x2);
       y2_opt  = optimum(id2_y2);
       z2_opt  = optimum(id2_z2);
       dotx2_opt  = optimum(id2_dotx2);
       doty2_opt  = optimum(id2_doty2);
       dotz2_opt  = optimum(id2_dotz2);
       phi_d2_opt  = optimum(id2_phi2);
       theta_d2_opt  = optimum(id2_theta2);
       yaw_d2_opt  = optimum(id2_yaw2);
       wx_d2_opt  = optimum(id2_wx2);
       wy_d2_opt  = optimum(id2_wy2);
       wz_d2_opt  = optimum(id2_wz2);
       Edrone2_opt  = optimum(id_Edrone2);
       
       
       command=[T2_opt(1),tau_x2_opt(1),tau_y2_opt(1),tau_z2_opt(1)];
       predicted_d2=[x2_opt,y2_opt,z2_opt,dotx2_opt,doty2_opt,dotz2_opt,phi_d2_opt,theta_d2_opt,yaw_d2_opt,wx_d2_opt,wy_d2_opt,wz_d2_opt];
       
       predicted_trajectory = [predicted_d2,Edrone2_opt];
       
   end
   
  end


