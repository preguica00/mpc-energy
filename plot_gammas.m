load('states1_teste2_t4_lambda3')
load('states2_teste2_t4_lambda3')
load('states1_teste2_t4_lambda2')
load('states2_teste2_t4_lambda2')

load('costt_energy1_teste2_t4_lambda025')
load('costt_energy1_teste2_t4_lambda05')
load('costt_energy1_teste2_t4')
load('costt_energy1_teste2_t4_lambda2')
load('costt_energy1_teste2_t4_lambda3')

load('costt1_teste2_t4_lambda025')
load('costt1_teste2_t4_lambda05')
load('costt1_teste2_t4')
load('costt1_teste2_t4_lambda2')
load('costt1_teste2_t4_lambda3')

load('costt2_teste2_t4_lambda025')
load('costt2_teste2_t4_lambda05')
load('costt2_teste2_t4')
load('costt2_teste2_t4_lambda2')
load('costt2_teste2_t4_lambda3')

cost_gamma025 = vecnorm(costt_energy1_teste2_t4_lambda025)+vecnorm(costt1_teste2_t4_lambda025)+vecnorm(costt2_teste2_t4_lambda025);
cost_gamma05 = vecnorm(costt_energy1_teste2_t4_lambda05)+vecnorm(costt1_teste2_t4_lambda05)+vecnorm(costt2_teste2_t4_lambda05);
cost_gamma = vecnorm(costt_energy1_teste2_t4)+vecnorm(costt1_teste2_t4)+vecnorm(costt2_teste2_t4);
cost_gamma2 = vecnorm(costt_energy1_teste2_t4_lambda2)+vecnorm(costt1_teste2_t4_lambda2)+vecnorm(costt2_teste2_t4_lambda2);
cost_gamma3 = vecnorm(costt_energy1_teste2_t4_lambda3)+vecnorm(costt1_teste2_t4_lambda3)+vecnorm(costt2_teste2_t4_lambda3);

figure
cost=[cost_gamma025,cost_gamma05,cost_gamma,cost_gamma2,cost_gamma3];
xaxis= [0.25,0.5,1,2,3];
plot(xaxis,cost,'-r','Linewidth', 1.5)
xlim([0.25 3])
xticks([0.25 0.5 1 2 3])
ylabel('$J$','Interpreter','latex','FontSize',14)
xlabel('$\gamma$','Interpreter','latex','FontSize',14)
