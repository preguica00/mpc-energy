function [m_drone,m_bar,m_bar2,g, C_barra, Ixx,Iyy,Izz,a1,a2,a3] = parameters
   


%masses
m_drone= 1;
m_bar=1.5;
m_bar2=0.9;
g=10;
C_barra = 1;

Ixx = 0.0119;
Iyy=0.0119;
Izz=0.0223;

a1 = (Iyy-Izz)/Ixx;
a2 = (Izz-Ixx)/Iyy;
a3 =  (Ixx-Iyy)/Izz;

end

