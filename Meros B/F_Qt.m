function fqt = F_Qt(t,x,qd1,qd2,qd1_d,qd2_d,qd1_dd,qd2_dd,lamda,K,Gamma) 
  q_d=[qd1(t); qd2(t);];
  q_dd_d=[qd1_dd(t);qd2_dd(t)];
  q_d_d=[qd1_d(t);qd2_d(t)];
  q=[x(1);x(2);];
  q_dot=[x(3);x(4);];
  q_d_r=q_dd_d-lamda*(q_dot-q_d_d);
  q_r=q_d_d-lamda*(q-q_d);
  fqt = zeros(4,1);
  fqt(1) = x(3);
  fqt(2)=x(4);
  H=Inertia_Matrix(x);
  C=Centrifuge_Matrix(x);
  G=Gravity_Matrix(x);
  invH=inv(H);
  Y=Palindromitis(q_d_r,q_r,q_dot,q);
  Theta_Ek=[x(5);x(6);x(7);x(8);];
  s=q_dot-q_r;
  u=Y*Theta_Ek-K*s;
  temp=-invH*C*[x(3);x(4);]-invH*G+invH*u;
  fqt(3) = temp(1);
  fqt(4)=temp(2);
  temp=F_Theta_t(Y,s,Gamma);
  fqt(5)=temp(1);  
  fqt(6)=temp(2);
  fqt(7)=temp(3); 
  fqt(8)=temp(4); 
end






% function fqt =  F_Qt(t,x,qd1,qd2,qd1_d,qd2_d,qd1_dd,qd2_dd) 
%   q_d=[qd1(t); qd2(t);];
%   q_dd_d=[qd1_dd(t);qd2_dd(t)];
%   q_d_d=[qd1_d(t);qd2_d(t)];
%   q=[x(1);x(2);];
%   q_dot=[x(3);x(4);];
%   lamda=3; %maybe must be diagonial????
%   q_d_r=q_dd_d-lamda*(q_dot-q_d_d);
%   q_r=q_d_d-lamda*(q-q_d);
%   fqt = zeros(4,1);
%   fqt(1) = x(3);
%   fqt(2)=x(4);
%   H=Inertia_Matrix(x);
%   C=Centrifuge_Matrix(x);
%   G=Gravity_Matrix(x);
%   invH=inv(H);
%   Y=Palindromitis(q_d_r,q_r,q_dot,q);
%   Theta_Ek=[x(5);x(6);x(7);x(8);x(9);x(10);1;];
%   s=q_dot-q_r;
%   k=[100 0;0 100;];
%   u=Y*Theta_Ek-k*s;
%   temp=-invH*C*[x(3);x(4);]-invH*G+invH*u;
%   fqt(3) = temp(1);
%   fqt(4)=temp(2);
%   temp=F_Theta_t(Y,s);
%   fqt(5)=temp(1);  
%   fqt(6)=temp(2);
%   fqt(7)=temp(3); 
%   fqt(8)=temp(4); 
%   fqt(9)=temp(5);
%   fqt(10)=temp(6); 
%   fqt(11)=temp(7); %its 1 and constant idk
% end