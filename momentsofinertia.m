function [Ixx,Iyy,Izz,a1,a2,a3] = momentsofinertia()

[m_drone,m_bar,g, C_barra] = parameters;
%moments of inertia drones
Ixx = 0.0119;
Iyy=0.0119;
Izz=0.0223;

a1 = (Iyy-Izz)/Ixx;
a2 = (Izz-Ixx)/Iyy;
a3 =  (Ixx-Iyy)/Izz;

% %moments of inertia bar
% Ixx_bar = 0;
% Iyy_bar = (m_bar*C_barra^2)/12;
% Izz_bar = (m_bar*C_barra^2)/12;
% 
% %moments of inertia of system - 1st drone e 2nd drone + bar 
% Ixx_sys= Ixx*m_drone*( ((C_barra^2)/4)*(cos(yaw_bar)).^2) + Ixx_bar;
% Iyy_sys=Iyy+m_drone*( ((C_barra^2)/4)*(sin(yaw_bar)).^2) + Iyy_bar;
% Izz_sys=Izz+m_drone*( ((C_barra^2)/4)*(sin(yaw_bar)).^2 + ((C_barra^2)/4)*(cos(yaw_bar)).^2) + Izz_bar;
% 

end