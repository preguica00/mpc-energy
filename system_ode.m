function dydt = system_ode(t,y,u,gamma_1,gamma_2,k,t1)
[H,Ts,drone1_info, drone2_info,rate_consumo] = system_info;
[m_drone,m_bar,m_bar2,g, C_barra, Ixx,Iyy,Izz,a1,a2,a3] = parameters;
%% Unpack the state and input vectors

% 
 if gamma_2==0
%states drone 1
x_d1  = y(1);
y_d1  = y(2);
z_d1  = y(3);
dotx_d1  = y(4);
doty_d1  = y(5);
dotz_d1  = y(6);
phi_d1= y(7);
theta_d1= y(8);
yaw_d1= y(9);
wx_d1= y(10);
wy_d1= y(11);
wz_d1= y(12);
E1= y(13);

%control variables drone 1
T1_d1  = u(1);
taux_d1 = u(2);
tauy_d1 = u(3);
tauz_d1 = u(4);

%Equations of motion
rot1x = (cos(yaw_d1)*sin(theta_d1)*cos(phi_d1) + sin(yaw_d1)*sin(phi_d1));
rot1y = (sin(yaw_d1)*sin(theta_d1)*cos(phi_d1) - cos(yaw_d1)*sin(phi_d1));

x_acceleration_d1 = (T1_d1*rot1x)/(m_drone+m_bar);
y_acceleration_d1= (T1_d1*rot1y)/(m_drone+m_bar);
z_acceleration_d1 = -g + (T1_d1*cos(theta_d1)*cos(phi_d1))/(m_drone+m_bar);

% %derivadas velocidades angulares drone 1
dot_wx1 = taux_d1 *Ixx^(-1)+ wy_d1*wz_d1*a1;
dot_wy1 = tauy_d1 *Iyy^(-1)+ wx_d1*wz_d1*a2;
dot_wz1 = tauz_d1 *Izz^(-1)+ wx_d1*wy_d1*a3;

% Energia drone
coefe = m_drone+m_bar;
v_1=[dotx_d1;doty_d1;dotz_d1];
w_1 = [wx_d1;wy_d1;wz_d1];
E1_dot = (coefe* (vecnorm(v_1)).^2 + (vecnorm(w_1).^2));

%
drone1_trans = [dotx_d1;doty_d1;dotz_d1;x_acceleration_d1;y_acceleration_d1;z_acceleration_d1];
drone1_rot = [wx_d1;wy_d1;wz_d1;dot_wx1;dot_wy1;dot_wz1];
dydt=[drone1_trans;drone1_rot;E1_dot];

 end
 
 
if gamma_2==1

%states drone 2
x_d2  = y(1);
y_d2  = y(2);
z_d2  = y(3);
dotx_d2  = y(4);
doty_d2  = y(5);
dotz_d2  = y(6);
phi_d2= y(7);
theta_d2= y(8);
yaw_d2= y(9);
wx_d2= y(10);
wy_d2= y(11);
wz_d2= y(12);
Edrone2= y(13);

%control variables drone 2
T2_d2  = u(1);
taux_d2 = u(2);
tauy_d2 = u(3);
tauz_d2 = u(4);


%%
t2=t1+3;
%%so quando drones se encontram
% coef_dronebar = 2*m_drone+m_bar;
% coef_drone =2*m_drone;

coef_dronebar =m_drone+m_bar;
coef_drone =m_drone;

v_2=[dotx_d2;doty_d2;dotz_d2];

w_2 = [wx_d2;wy_d2;wz_d2];

if k<t2
Edrone2_dot = (coef_drone* (norm(v_2)).^2 + (norm(w_2).^2));

%%Equations of motion
rot2x = (cos(yaw_d2)*sin(theta_d2)*cos(phi_d2) + sin(yaw_d2)*sin(phi_d2));
rot2y = (sin(yaw_d2)*sin(theta_d2)*cos(phi_d2) - cos(yaw_d2)*sin(phi_d2));
 
x_acceleration_d2 = (T2_d2*rot2x)/(m_drone);
y_acceleration_d2= (T2_d2*rot2y)/(m_drone);
z_acceleration_d2 = -g + (T2_d2*cos(theta_d2)*cos(phi_d2))/(m_drone);
 

% %derivadas velocidades angulares drones
dot_wx2 = taux_d2* Ixx^(-1) + wy_d2*wz_d2*a1;
dot_wy2= tauy_d2* Iyy^(-1) + wx_d2*wz_d2*a2;
dot_wz2= tauz_d2* Izz^(-1) + wx_d2*wy_d2*a3;
end

if k>=t2
Edrone2_dot = (coef_dronebar* (norm(v_2)).^2 + (norm(w_2).^2));

%%Equations of motion
rot2x = (cos(yaw_d2)*sin(theta_d2)*cos(phi_d2) + sin(yaw_d2)*sin(phi_d2));
rot2y = (sin(yaw_d2)*sin(theta_d2)*cos(phi_d2) - cos(yaw_d2)*sin(phi_d2));
 
x_acceleration_d2 = (T2_d2*rot2x)/(m_drone+m_bar);
y_acceleration_d2= (T2_d2*rot2y)/(m_drone+m_bar);
z_acceleration_d2 = -g + (T2_d2*cos(theta_d2)*cos(phi_d2))/(m_drone+m_bar);
 

% %derivadas velocidades angulares drones
dot_wx2 = taux_d2* Ixx^(-1) + wy_d2*wz_d2*a1;
dot_wy2= tauy_d2* Iyy^(-1) + wx_d2*wz_d2*a2;
dot_wz2= tauz_d2* Izz^(-1) + wx_d2*wy_d2*a3;
end
%%
drone2_trans = [dotx_d2;doty_d2;dotz_d2;x_acceleration_d2;y_acceleration_d2;z_acceleration_d2];
drone2_rot = [wx_d2;wy_d2;wz_d2;dot_wx2;dot_wy2;dot_wz2];

dydt=[drone2_trans;drone2_rot;Edrone2_dot];

end


end