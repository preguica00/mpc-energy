function [c, ceq] = discretization(y,init_vector,gamma_1,gamma_2,k,t1)

[H,Ts,drone1_info, drone2_info,rate_consumo] = system_info;
%% Unpacking drones
% drone 1 

if gamma_2==0

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

% Energy
id_Edrone1 = rate_consumo(1,:);

 %% Assigning drone variables
% drone 1

T1 = y(id1_T1);
tau_x1 = y(id1_taux1);
tau_y1 = y(id1_tauy1);
tau_z1 = y(id1_tauz1);

x_d1  = y(id1_x1);
y_d1  = y(id1_y1);
z_d1  = y(id1_z1);
dotx_d1  = y(id1_dotx1);
doty_d1  = y(id1_doty1);
dotz_d1  = y(id1_dotz1);

phi_d1 = y(id1_phi1);
theta_d1 = y(id1_theta1);
yaw_d1 = y(id1_yaw1);
wx_d1 = y(id1_wx1);
wy_d1 = y(id1_wy1);
wz_d1 = y(id1_wz1);
E_drone1  = y(id_Edrone1);

states = [x_d1,y_d1,z_d1,dotx_d1,doty_d1,dotz_d1,phi_d1,theta_d1,yaw_d1,wx_d1,wy_d1,wz_d1,E_drone1];
control=[T1,tau_x1, tau_y1,tau_z1]';

end

if gamma_2==1
    
    %% Unpacking drones
% drone 2
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


% Energy
id_Edrone2 = rate_consumo(2,:);


%%bar
% id_phi_bar = bar_info(1,:);
% id_theta_bar = bar_info(2,:);
% id_yaw_bar = bar_info(3,:);
% id_wx_bar = bar_info(4,:);
% id_wy_bar = bar_info(5,:);
% id_wz_bar = bar_info(6,:);

% drone 2
T2 = y(id2_T2);
tau_x2 = y(id2_taux2);
tau_y2 = y(id2_tauy2);
tau_z2 = y(id2_tauz2);

x_d2  = y(id2_x2);
y_d2  = y(id2_y2);
z_d2  = y(id2_z2);
dotx_d2  = y(id2_dotx2);
doty_d2  = y(id2_doty2);
dotz_d2  = y(id2_dotz2);

phi_d2 = y(id2_phi2);
theta_d2 = y(id2_theta2);
yaw_d2 = y(id2_yaw2);
wx_d2 = y(id2_wx2);
wy_d2 = y(id2_wy2);
wz_d2 = y(id2_wz2);
E_drone2  = y(id_Edrone2);


states = [x_d2,y_d2,z_d2,dotx_d2,doty_d2,dotz_d2,phi_d2,theta_d2,yaw_d2,wx_d2,wy_d2,wz_d2,E_drone2];
control=[T2,tau_x2,tau_y2,tau_z2]';


end


%%
current_state=init_vector;
state =[current_state,states'];

% vel=[dotx_d1;doty_d1;dotz_d1];
% reff=[ones(2*H,1);zeros(H,1)];

% Run discrete prediction
ceq = [];
for i = 1:H
ceq = [ceq; [(state(:,i+1) - timestep_euler(Ts,state(:,i), control(:,i),gamma_1,gamma_2,k,t1)) ]];

end


c=[];

end
