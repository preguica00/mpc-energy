function [H,Ts,drone1_info, drone2_info,rate_consumo] = system_info
    
    H=22;
    Ts = 0.1;
    
    %drone 1
    id1_T1 = 1:H;
    id1_taux1 = (1:H) + H;
    id1_tauy1= (1:H) + 2*H;
    id1_tauz1 = (1:H) + 3*H;

    id1_x1= (1:H) + 4*H;
    id1_y1 = (1:H) + 5*H;
    id1_z1= (1:H) + 6*H;
    id1_dotx1= (1:H) + 7*H;
    id1_doty1 = (1:H) + 8*H;
    id1_dotz1= (1:H) + 9*H;
    
    
    id1_phi1= (1:H) + 10*H;
    id1_theta1 = (1:H) + 11*H;
    id1_yaw1= (1:H) + 12*H;
    
    id1_wx1 = (1:H) + 13*H;
    id1_wy1= (1:H) + 14*H;
    id1_wz1 = (1:H) + 15*H;
    
    id_Edrone1 = (1:H) + 16*H; %taxa consumo drone


    id2_T2= 1:H;
    id2_taux2 = (1:H) + H;
    id2_tauy2= (1:H) + 2*H;
    id2_tauz2 = (1:H) + 3*H;
    
    id2_x2= (1:H) + 4*H;
    id2_y2 = (1:H) + 5*H;
    id2_z2= (1:H) + 6*H;
    id2_dotx2= (1:H) + 7*H;
    id2_doty2 = (1:H) + 8*H;
    id2_dotz2= (1:H) + 9*H;

    id2_phi2= (1:H) + 10*H;
    id2_theta2 = (1:H) + 11*H;
    id2_yaw2= (1:H) + 12*H;
    
    id2_wx2 = (1:H) + 13*H;
    id2_wy2= (1:H) + 14*H;
    id2_wz2 = (1:H) + 15*H;
    id_Edrone2 = (1:H) + 16*H; %taxa consumo drone
    
    %%bar
%     phi_b = (1:H) + 17*H;
%     theta_b = (1:H) + 18*H;
%     yaw_b = (1:H) + 19*H;
%     
%     wx_b = (1:H) + 20*H;
%     wy_b = (1:H) + 21*H;
%     wz_b = (1:H) + 22*H;
    
    drone1_U=[id1_T1;id1_taux1;id1_tauy1;id1_tauz1]; 
    drone1_states=[id1_x1;id1_y1;id1_z1;id1_dotx1;id1_doty1;id1_dotz1;id1_phi1;id1_theta1;id1_yaw1;id1_wx1;id1_wy1;id1_wz1];   
    drone1_info = [drone1_U;drone1_states];
    
    drone2_U=[id2_T2;id2_taux2;id2_tauy2;id2_tauz2];
    drone2_states=[id2_x2;id2_y2;id2_z2;id2_dotx2;id2_doty2;id2_dotz2;id2_phi2;id2_theta2;id2_yaw2;id2_wx2;id2_wy2;id2_wz2];
    drone2_info=[drone2_U;drone2_states];
    
    rate_consumo=[id_Edrone1;id_Edrone2]; 
%     bar_info=[phi_b;theta_b;yaw_b;wx_b;wy_b;wz_b];

end

