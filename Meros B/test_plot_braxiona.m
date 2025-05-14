clear;

tspan = [0 45];
x0=[0;0;0;0;3.8675;0.655;0.8;68.67;];
m1=10;
m2=8;
l1=0.5;
l2=0.4;
g=9.81;
lc1r=0.25;
lc2r=0.1;
I1r=0.23;
I2r=0.2;
theta1_r=m1*lc1r^2+m2*lc2r^2+m2*l1^2+I1r+I2r;
theta2_r=m2*lc2r^2+I2r;
theta3_r=m2*l1*lc2r;
theta4_r=m2*l1*g+m1*lc1r*g;
qd1=@(tx) (pi/6)*square(tx);
qd2=@(tx) (pi/6)*square(tx);
qd1_d=@(tx) 0;
qd2_d=@(tx) 0;
qd1_dd=@(tx) 0;
qd2_dd=@(tx) 0;
% qd1=@(tx) pi/3+(pi/3)*sin(0.4*pi*tx);
% qd2=@(tx) -pi/4+(pi/6)*sin(0.3*pi*tx);
% qd1_d=@(tx) (pi/3)*0.4*pi*cos(0.4*pi*tx);
% qd2_d=@(tx) (pi/6)*0.3*pi*cos(0.3*pi*tx);
% qd1_dd=@(tx) -(pi/3)*(0.4*pi)^2*sin(0.4*pi*tx);
% qd2_dd=@(tx) -(pi/6)*(0.3*pi)^2*sin(0.3*pi*tx);


%καλα για ημιτονα
Gamma=[0.001 0 0 0;0 0.001 0 0; 0 0 0.001 0; 0 0 0 0.0005;];
lamda=3.5*eye(2);
K=400*eye(2);



% options = odeset('RelTol',1e-6,'AbsTol',1e-2,'Refine',10);
[t,x] = ode45(@(t,x) F_Qt(t,x,qd1,qd2,qd1_d,qd2_d,qd1_dd,qd2_dd,lamda,K,Gamma), tspan, x0);
figure;
subplot(2,1,1);
plot(t,x(:,1),t,qd1(t));
title("Χρονική απόκριση γωνίας q1(t) της πρώτης άρθρωσης και επιθυμητής τροχίας qd1(t) ")
legend('q1','qd1');
xlabel("Time: t in seconds")
ylabel('q1 in rad')
subplot(2,1,2);
plot(t,x(:,2),t,qd2(t));
title("Χρονική απόκριση γωνίας q2(t) της πρώτης άρθρωσης και επιθυμητής τροχίας qd2(t) ")
legend('q2','qd2');
xlabel("Time: t in seconds")
ylabel('q2 in rad')
q1=x(:,1);
q2=x(:,2);
qdot1=x(:,3);
qdot2=x(:,4);
theta1=x(:,5);
theta2=x(:,6);
theta3=x(:,7);
theta4=x(:,8);
% 
for j=1:length(t)
  q=[q1(j);q2(j)];
  q_dot=[qdot1(j);qdot2(j)];
  q_d=[qd1(t(j)); qd2(t(j));];
  q_dd_d=[qd1_dd(t(j));qd2_dd(t(j))];
  q_d_d=[qd1_d(t(j));qd2_d(t(j))];
  q_d_r=q_dd_d-lamda*(q_dot-q_d_d);
  q_r=q_d_d-lamda*(q-q_d);
  Theta_Ek=[theta1(j);theta2(j);theta3(j);theta4(j);];
  s=q_dot-q_r;
  Y=Palindromitis(q_d_r,q_r,q_dot,q);
  u{j}=Y*Theta_Ek-K*s;
end

for i=1:length(u)
    u1(i)=u{i}(1); 
    u2(i)=u{i}(2);    
end
figure;
plot(t,u1,t,u2)
title("Είσοδος Ελέγχου u")
legend("u1","u2")
xlabel("Time: t in seconds")
ylabel("Torque: u in Nm")


figure;
subplot(2,2,1)
plot(t,theta1,0:1:45,theta1_r*ones(1,length(0:1:45)),'.');
title('Απόκριση θ1');
xlabel("Time: t in seconds")

subplot(2,2,2)
plot(t,theta2,0:1:45,theta2_r*ones(1,length(0:1:45)),'.');
title('Απόκριση θ2');
xlabel("Time: t in seconds")

subplot(2,2,3)
plot(t,theta3,0:1:45,theta3_r*ones(1,length(0:1:45)),'.');
title('Απόκριση θ3');
xlabel("Time: t in seconds")

subplot(2,2,4)
plot(t,theta4,0:1:45,theta4_r*ones(1,length(0:1:45)),'.');
title('Απόκριση θ4');
xlabel("Time: t in seconds")

figure;
e1=q1-qd1(t);
e2=q2-qd2(t);
subplot(2,2,[1 2])
plot(e1,e2);
title("Σφάλμα στο φασικό επίπεδο")
xlabel("Σφάλμα e1 για την πρώτη άθρωση")
ylabel("Σφάλμα e2 για την δεύτερη άθρωση")
grid on;

subplot(2,2,3)
plot(t,e1)
title("Σφάλμα e1 για την πρώτη άθρωση")
xlabel("Time: t in seconds")
ylabel("e1")
grid on;

subplot(2,2,4)
plot(t,e2)
title("Σφάλμα e2 για την δεύτερη άθρωση")
xlabel("Time: t in seconds")
ylabel("e2")
grid on;


% obj=VideoWriter('Animation','MPEG-4');
% open(obj);
% q1=x(:,1);
% q2=x(:,2);
% figure;
% axis equal;
% axis([0,1,-1,1])
% for k = 1:130:length(t)
%     h = animatedline([0 0.5*cos(q1(k))],[0 0.5*sin(q1(k))],'Color','r','LineWidth',3);
%     drawnow
%     z = animatedline([0.5*cos(q1(k)) 0.5*cos(q1(k))+0.4*cos(q2(k))],[0.5*sin((q1(k))) 0.5*sin((q1(k)))+0.4*sin(q2(k))],'Color','g','LineWidth',3);
%     drawnow
%     hold on;
%     writeVideo(obj,getframe);
%     pause(0.05);
%     clearpoints(h)
%     clearpoints(z)
% end
% close(obj)

