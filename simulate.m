function simulate()

    close all
    clf
    hold on
    
 [m_drone,m_bar,g, C_barra, Ixx,Iyy,Izz,a1,a2,a3] = parameters;
 [H,Ts,drone1_info, drone2_info,rate_consumo] = system_info;

    plot_trajectory_d1_ida = plot(0,0,'k-','MarkerSize',5,'Linewidth', 1.5);
    plot_trajectory_d2_ida = plot(0,0,'or-','MarkerSize',4,'Linewidth', 1.5);
    

    states1_teste2_t4_massa15=[];
    states2_teste2_t4_massa15=[];

    control1_teste2_t4_massa15=[];
    control2_teste2_t4_massa15=[];
    
    commands_1=[];
    commands_2=[];
    
    axis square
%     ylim([0 1.5])
%     xlim([0 1.5])
    
%     for t1=6:10
    

current_state = [0;zeros(2,1);1.9*ones(2,1);zeros(8,1)];
current_MPC_solution = [];

costt1_teste2_t4_massa15=[];
costt_energy1_teste2_t4_massa15=[];
costt2_teste2_t4_massa15=[];


gamma_1=1;
gamma_2=0;
t1=4;
t2=t1+3;

for k = 1:20   %% Run the controller
    
    [command, current_MPC_solution, predicted_trajectory,costt,costt_energy] = ...
        optimizetrajectory(current_state, current_MPC_solution,k,gamma_1,gamma_2,t1);
    
    %% Run the simulation
    
    current_state = simulate_timestep(current_state, command,gamma_1,gamma_2,k,t1);
    
    %% Visualize
            
 
    if gamma_2==0
        plot_trajectory_d1_ida.XData(end+1) = current_state(1);
        plot_trajectory_d1_ida.YData(end+1) = current_state(2);
        
        states1_teste2_t4_massa15(end+1,:) = current_state;
%                     fprintf('hey \n')
        control1_teste2_t4_massa15(end+1,:) = current_MPC_solution;
        commands_1(end+1,:) = command;
        c1=current_state(1)
        c2=current_state(2)

        costt1_teste2_t4_massa15(end+1,:)=costt;
        costt_energy1_teste2_t4_massa15(end+1,:)=costt_energy;

       
        if k==t1
%         if current_state(13)>=3.78 && current_state(13)<=5.4 %em vez de 432 %quando só tiver \20% de bateria até nao ter nenhuma
            pos1=current_state(1)
            pos2=current_state(2)
            fprintf('energy done \n')
            
            t1=k
            gamma_1=0;
            gamma_2=1;
            fprintf('job done \n')
%             current_state = [0;zeros(2,1);1.9*ones(2,1);zeros(8,1)];  %for symmetric
            current_state = [0;zeros(2,1);1.6*ones(2,1);zeros(8,1)];    %for assymmetric

            current_MPC_solution = [];
            
            
        end
        

    end
    
    g1=gamma_1
    g2=gamma_2
    
    
    
    if     gamma_2==1 && gamma_1==0 
        
        plot_trajectory_d2_ida.XData(end+1) = current_state(1);
        plot_trajectory_d2_ida.YData(end+1) = current_state(2);
        
        c1=current_state(1)
        c2=current_state(2)
           if current_state(13)>=5.4
                        fprintf('bye \n')
            break
           end
        
        if k>=t1+1
            states2_teste2_t4_massa15(end+1,:) = current_state;
            control2_teste2_t4_massa15(end+1,:) = current_MPC_solution;
            commands_2(end+1,:) = command;
            
        end
        
        if k==t2
            
            current_state(1)=pos1;
            current_state(2)=pos2;
            
        end
        costt2_teste2_t4_massa15(end+1,:)=costt;
%         costt_energy2_teste_t4(end+1,:)=costt_energy;



    end
    
    drawnow
    pause(0.05)
    legend([plot_trajectory_d1_ida, plot_trajectory_d2_ida],'Drone 1 starts','Drone 2 starts','Location','Northwest')
    
    aa=k
    %         bb=t1
    
% end
    end

%T1
figure
plot(commands_1(:,1));

%taux1,tauy1,tauz1,
figure
plot(commands_1(:,2),'b');
hold on;
plot(commands_1(:,3),'r');
hold on;
plot(commands_1(:,4),'k');
% legend({'\tau_{x1}', '\tau_{y1}','\tau_{z1}'}, 'Interpreter','latex','FontSize',12)

%T2
% figure
% plot(commands_2(:,1));
% 
% %taux2,tauy2,tauz2,
% figure
% plot(commands_2(:,2),'b');
% hold on;
% plot(commands_2(:,3),'r');
% hold on
% plot(commands_2(:,4),'k');
% legend({'\tau_{x2}', '\tau_{y2}','\tau_{z2}'}, 'Interpreter','latex','FontSize',12)



save('states2_teste2_t4_massa15.mat','states2_teste2_t4_massa15')
save('control2_teste2_t4_massa15.mat','control2_teste2_t4_massa15') 
save('states1_teste2_t4_massa15.mat','states1_teste2_t4_massa15')
save('control1_teste2_t4_massa15.mat','control1_teste2_t4_massa15')


save('costt1_teste2_t4_massa15.mat','costt1_teste2_t4_massa15')
save('costt_energy1_teste2_t4_massa15.mat','costt_energy1_teste2_t4_massa15')
save('costt2_teste2_t4_massa15.mat','costt2_teste2_t4_massa15')
% save('costt_energy2_teste_t4.mat','costt_energy2_teste_t4')


%gamma=2


end
