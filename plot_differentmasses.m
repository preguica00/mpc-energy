
%para drones simetricos
% load('states2_teste2_t4_massa06')
load('states2_teste2_t4_massa08')
load('states2_teste2_t4')
load('states2_teste2_t4_massa1')
load('states2_teste2_t4_massa15')
load('states2_teste2_t4_massa12')

% load('states2_teste2_t12_massa06')
load('states2_teste2_t12_massa08')
load('states2_teste2_t12')
load('states2_teste2_t12_massa1')
load('states2_teste2_t12_massa15')
load('states2_teste2_t12_massa12')


vel_massa05_t4 = vecnorm(states2_teste2_t4(:,4)+states2_teste2_t4(:,5));
% vel_massa06_t4 = vecnorm(states2_teste2_t4_massa06(:,4)+states2_teste2_t4_massa06(:,5));
vel_massa08_t4 = vecnorm(states2_teste2_t4_massa08(:,4)+states2_teste2_t4_massa08(:,5));
vel_massa1_t4 = vecnorm(states2_teste2_t4_massa1(:,4)+states2_teste2_t4_massa1(:,5));
vel_massa12_t4 = vecnorm(states2_teste2_t4_massa12(:,4)+states2_teste2_t4_massa12(:,5));
vel_massa15_t4 = vecnorm(states2_teste2_t4_massa15(:,4)+states2_teste2_t4_massa15(:,5));


vel_massa05_t12 = vecnorm(states2_teste2_t12(:,4)+states2_teste2_t12(:,5));
% vel_massa06_t12 = vecnorm(states2_teste2_t12_massa06(:,4)+states2_teste2_t12_massa06(:,5));
vel_massa08_t12 = vecnorm(states2_teste2_t12_massa08(:,4)+states2_teste2_t12_massa08(:,5));
vel_massa1_t12 = vecnorm(states2_teste2_t12_massa1(:,4)+states2_teste2_t12_massa1(:,5));
vel_massa12_t12 = vecnorm(states2_teste2_t12_massa12(:,4)+states2_teste2_t12_massa12(:,5));
vel_massa15_t12 = vecnorm(states2_teste2_t12_massa15(:,4)+states2_teste2_t12_massa15(:,5));


aa = vecnorm(states2_teste2_t12_massa12(:,4)) +  vecnorm(states2_teste2_t12_massa12(:,5))

bb =vecnorm(states2_teste2_t12_massa15(:,4)) + vecnorm(states2_teste2_t12_massa15(:,5))

xaxis = [0.5,0.8,1,1.2];
vel_t4 = [vel_massa05_t4,vel_massa08_t4,vel_massa1_t4,vel_massa12_t4];
vel_t12 = [vel_massa05_t12,vel_massa08_t12,vel_massa1_t12,vel_massa12_t12];

figure
plot(xaxis,vel_t4,'b', 'Linewidth', 1.5)
hold on;
plot(xaxis,vel_t12,'r', 'Linewidth', 1.5)
xticks([0.5 0.8 1 1.2])
ylabel({'$v_2$'}, 'Interpreter','latex','FontSize',14)
xlabel('bar mass','FontSize',14)
legend({'Case 1 ($t_1=4$)','Case 2 ($t_1=12$)'}, 'Interpreter','latex','FontSize',12)

% figure
% plot(states2_teste2_t4(:,4))
% hold on;
% plot(states2_teste2_t4_massa06(:,4),'b')
% hold on;
% plot(states2_teste2_t4_massa08(:,4),'k')
% hold on;
% plot(states2_teste2_t4_massa1(:,4),'r')
% xlim([1 16])