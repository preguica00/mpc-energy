% load ('states1_t1_choice.mat')
load('states2_teste2_ass_t5.mat')

figure
plot(5.4*ones(15,1)-states2_teste2_ass_t5(:,13))
% load ('control1.mat')
% load ('states2.mat')
% load ('control2.mat')
% load('states1_t4')
% load('states2_t4')
% load('states1_ass_t4')
% load('states2_ass_t4')
% 
% figure
% plot(states1_t1_choice(:,1), 'b', 'Linewidth', 1.5);
% xlim([1 5])
% ylabel('x_{1} (m)','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(states1_t1_choice(:,2), 'b', 'Linewidth', 1.5);
% xlim([1 5])
% ylabel('y_{1} (m)','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(states1_t1_choice(:,3), 'b', 'Linewidth', 1.5);
% xlim([1 5])
% % ylim([0.5 1])
% ylabel('z_{1} (m)','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% 
% figure
% plot(states1_t1_choice(:,4),'b', 'Linewidth', 1.5);
% xlim([1 5])
% ylabel('$\dot{x}_{1}$ (m/s)', 'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(states1_t1_choice(:,5),'b', 'Linewidth', 1.5);
% xlim([1 5])
% ylabel('$\dot{y}_{1}$ (m/s)', 'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(states1_t1_choice(:,6),'b', 'Linewidth', 1.5);
% xlim([1 5])
% ylabel('$\dot{z}_{1}$ (m/s)', 'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% 
% figure
% % subplot(2,1,1)
% plot(rad2deg(states1_t1_choice(:,7)),'b', 'Linewidth', 1.5);
% xlim([1 5])
% ylabel('\phi_{1} (º)','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% % subplot(2,1,1)
% plot(rad2deg(states1_t1_choice(:,8)),'b', 'Linewidth', 1.5);
% xlim([1 5])
% ylabel('\theta_{1} (º)','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% 
% figure
% % subplot(2,1,1)
% plot(rad2deg(states1_t1_choice(:,9)),'b', 'Linewidth', 1.5);
% xlim([1 5])
% ylabel('\psi_{1} (º)','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(rad2deg(states1_t1_choice(:,10)),'b', 'Linewidth', 1.5);
% xlim([1 5])
% ylabel('$wx_{1}$ $(^\circ / s)$', 'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(rad2deg(states1_t1_choice(:,11)),'b', 'Linewidth', 1.5);
% xlim([1 5])
% ylabel('$wy_{1}$ $(^\circ / s)$', 'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(rad2deg(states1_t1_choice(:,12)),'b', 'Linewidth', 1.5);
% xlim([1 5])
% ylabel('$wz_{1}$ $(^\circ / s)$', 'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% x = linspace(1,20);
% y = 3.78*ones(size(x)) ;
% xx = linspace(1,20);
% yy = 5.4*ones(size(x)) ;
% 
% x_ver = 4*ones(size(y));
% y_ver = linspace(1,5.4) ;
% 
% x_ver2 = 12*ones(size(y));
% y_ver2 = linspace(1,5.4) ;
% 
% energia = states1_t1_choice(:,13);
% 
% figure1 = figure;
% axes1 = axes('Parent', figure1);
% hold(axes1,'on');
% rectangle('Parent',axes1,'Position',[4 3.78 8 1.62],'FaceColor',[1 0 0]); % Plots the rectangle
% hold on;
% plot(energia(1:12),'b', 'Linewidth', 1.5);
% hold on;
% plot(x, y, '--r', 'Linewidth', 2)
% hold on;
% plot(xx, yy, '--r', 'Linewidth', 2)
% hold on;
% plot(x_ver, y_ver, '--b', 'Linewidth', 2)
% hold on;
% plot(x_ver2, y_ver2, '--b', 'Linewidth', 2)
% xlim([1 20])
% ylim([1 6])
% ylabel({'$E_{c1}$'}, 'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% legend('Drone 1 Energy' )
% 
% 
% figure
% plot(5.4*ones(12,1)-energia(1:12),'b', 'Linewidth', 1.5);
% % hold on;
% % plot(x, y, 'r', 'Linewidth', 2)
% % hold on;
% % plot(xx, yy, 'r', 'Linewidth', 2)
% xlim([1 20])
% ylabel({'$E_{1}$'}, 'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% %Drone 1
% 
% figure
% plot(5.4*ones(4,1)-states1_t4(:,13),'b', 'Linewidth', 1.5)
% 
% figure
% plot(5.4*ones(16,1)-states2_t4(:,13),'b', 'Linewidth', 1.5)
% 
% figure
% plot(5.4*ones(4,1)-states1_ass_t4(:,13),'b', 'Linewidth', 1.5)
% 
% figure
% plot(5.4*ones(16,1)-states2_ass_t4(:,13),'b', 'Linewidth', 1.5)% Drone 2
% 
% figure
% plot(states2_ass_t4(:,4))
% 
% figure
% plot(state_trajectory_2(:,1), 'b', 'Linewidth', 1.5);
% xlim([6 15])
% ylabel('x_{2} (m)','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(state_trajectory_2(:,2), 'b', 'Linewidth', 1.5);
% xlim([6 15])
% ylabel('y_{2} (m)','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(state_trajectory_2(:,3), 'b', 'Linewidth', 1.5);
% xlim([6 15])
% % ylim([0.5 1])
% ylabel('z_{2} (m)','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% 
% figure
% plot(state_trajectory_2(:,4),'b', 'Linewidth', 1.5);
% xlim([6 15])
% ylabel('$\dot{x}_{2}$ (m/s)', 'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(state_trajectory_2(:,5),'b', 'Linewidth', 1.5);
% xlim([6 15])
% ylabel('$\dot{y}_{2}$ (m/s)', 'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(state_trajectory_2(:,6),'b', 'Linewidth', 1.5);
% xlim([6 15])
% ylabel('$\dot{z}_{2}$ (m/s)', 'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(rad2deg(state_trajectory_2(:,7)),'b', 'Linewidth', 1.5);
% xlim([6 15])
% ylabel({'\phi_2 (º)'}, 'FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(rad2deg(state_trajectory_2(:,8)),'b', 'Linewidth', 1.5);
% xlim([6 15])
% ylabel({'\theta_2 (º)'}, 'FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(rad2deg(state_trajectory_2(:,9)),'b', 'Linewidth', 1.5);
% xlim([6 15])
% ylabel({'\psi_2 (º)'}, 'FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(rad2deg(state_trajectory_2(:,10)),'b', 'Linewidth', 1.5);
% xlim([6 15])
% ylabel({'wx_2'}, 'FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(rad2deg(state_trajectory_2(:,11)),'b', 'Linewidth', 1.5);
% xlim([6 15])
% ylabel({'wy_2'}, 'FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(rad2deg(state_trajectory_2(:,12)),'b', 'Linewidth', 1.5);
% xlim([6 15])
% ylabel({'wz_2'}, 'FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% plot(state_trajectory_2(:,13),'b', 'Linewidth', 1.5);
% xlim([6 15])
% ylabel({'E_2'}, 'FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% 
% % drone 1
% figure
% stairs(control_variables_1(:,1),'-k', 'Linewidth', 1);
% xlim([1 5])
% ylabel({'$T_{1}$ (N)'},'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% stairs(control_variables_1(:,2),'-k', 'Linewidth', 1);
% xlim([1 5])
% ylabel({'$\tau_{x1}$ (Nm)'},'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% stairs(control_variables_1(:,3),'-k', 'Linewidth', 1);
% xlim([1 5])
% ylabel({'$\tau_{y1}$ (Nm)'},'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% stairs(control_variables_1(:,4),'-k', 'Linewidth', 1);
% xlim([1 5])
% ylabel({'$\tau_{z1}$ (Nm)'},'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% %drone 2
% figure
% stairs(control_variables_2(:,1),'-k', 'Linewidth', 1);
% xlim([6 15])
% ylabel({'$T_{2}$ (N)'},'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% stairs(control_variables_2(:,2),'-k', 'Linewidth', 1);
% xlim([6 15])
% ylabel({'$\tau_{x2}$ (Nm)'},'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% stairs(control_variables_2(:,3),'-k', 'Linewidth', 1);
% xlim([6 15])
% ylabel({'$\tau_{y2}$ (Nm)'},'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)
% 
% figure
% stairs(control_variables_2(:,4),'-k', 'Linewidth', 1);
% xlim([6 15])
% ylabel({'$\tau_{z2}$ (Nm)'},'Interpreter','latex','FontSize',14)
% xlabel('Discrete Time','FontSize',14)