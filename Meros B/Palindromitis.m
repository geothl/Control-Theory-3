function Y = Palindromitis(q_dot_dot,q_dot,q_dotin,q)
m1=10;
m2=8;
l1=0.5;
l2=0.4;
g=9.81;
y13=-sin(q(2))*(q_dotin(1)*q_dot(2)+q_dotin(2)*q_dot(2)+q_dotin(2)*q_dot(1));
y13=y13+(2*q_dot_dot(1)+q_dot_dot(2))*cos(q(2))+(1/l1)*g*cos(q(1)+q(2));
Y1c=[q_dot_dot(1);0;];
Y2c=[q_dot_dot(2);q_dot_dot(1)+q_dot_dot(2)];
Y3c=[y13;q_dot_dot(1)*cos(q(2))+q_dot(1)*q_dotin(1)*sin(q(2))+(1/l1)*g*cos(q(1)+q(2))];
Y4c=[cos(q(1));0];
Y=[Y1c Y2c Y3c Y4c];
end




% function Y = Palindromitis(q_dot_dot,q_dot,q_dotin,q)
% m1=10;
% m2=8;
% l1=0.5;
% l2=0.4;
% g=9.81;
% y12=m2*g*cos(q(1)+q(2))-q_dot(1)*q_dotin(2)*m2*l1*sin(q(2))-m2*l1*q_dot(2)*(q_dotin(1)+q_dotin(2))*sin(q(2));
% y12=y12+m2*l1*cos(q(2))*q_dot_dot(2)+4*m2*l1*cos(q(2))*q_dot_dot(2);
% Y1c=[m1*g*cos(q(1));0;];
% Y2c=[y12;m2*g*cos(q(1)+q(2))+m2*l1*cos(q(2))*q_dot_dot(1)+m2*l1*sin(q(2))*q_dotin(1)*q_dot(1)];
% Y3c=[q_dot_dot(1);0];
% Y4c=[q_dot_dot(1)+q_dot_dot(2);q_dot_dot(1)+q_dot_dot(2)];
% Y5c=[m1*q_dot_dot(1);0;];
% Y6c=[m2*(q_dot_dot(1)+q_dot_dot(2));m2*q_dot_dot(2)+m2*l1*cos(q(2))*q_dot_dot(1)];
% Y7c=[g*cos(q(1))*m2*l1+m2*l1^2*q_dot_dot(1);0];
% Y=[Y1c Y2c Y3c Y4c Y5c Y6c Y7c];
% 
% end