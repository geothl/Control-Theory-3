function fpm = F_PEMA(t,dynamic,qd1,qd2,a1,b1,a2,b2) 
  x=[dynamic(1);dynamic(2);dynamic(3);dynamic(4);];
  xm=[dynamic(29);dynamic(30);dynamic(31);dynamic(32)];
  xe=xm-x;
  ip=dynamic(5:20);
  ip=reshape(ip,[4,4]);
  ipm=dynamic(21:28);
  ipm=reshape(ipm,[4,2]);
  % ip=zeros(4,4);
  % ip(1,1)=dynamic(5); ip(2,1)=dynamic(6); ip(3,1)=dynamic(7); ip(4,1)=dynamic(8); ip(1,2)=dynamic(9); ip(2,2)=dynamic(10); ip(3,2)=dynamic(11);
  % ip(4,2)=dynamic(12); ip(1,3)=dynamic(13); ip(2,3)=dynamic(14); ip(3,3)=dynamic(15); ip(4,3)=dynamic(16); ip(1,4)=dynamic(17); ip(2,4)=dynamic(18);
  % ip(3,4)=dynamic(19); ip(4,4)=dynamic(20); 
  % ipm=zeros(4,2);
  % ipm(1,1)=dynamic(21); ipm(2,1)=dynamic(22); ipm(3,1)=dynamic(23); ipm(4,1)=dynamic(24); ipm(1,2)=dynamic(25); ipm(2,2)=dynamic(26); ipm(3,2)=dynamic(27);
  % ipm(3,2)=dynamic(28);
  qd=[qd1(t); qd2(t);];
  r=qd;
  Am=[0 0 1 0;0 0 0 1;-16 0 -8 0;0 -16 0 -8;];
  Bm=[0 0;0 0;16 0;0 16;];
  B=eye(4);
  Q=eye(4);
  Ce=transpose(B)*lyap(transpose(Am),Q);
  ye=Ce*xe;
  u=u_calc(x,r,ye,ip,ipm,a1,b1,a2,b2);
  % temp=A*x+B*u;  
  H=Inertia_Matrix(x);
  C=Centrifuge_Matrix(x);
  G=Gravity_Matrix(x);
  invH=inv(H);
  temp=-invH*C*[x(3);x(4);]-invH*G+invH*u;
  fpm(1)=x(3);
  fpm(2)=x(4);
  fpm(3)=temp(1);
  fpm(4)=temp(2);
  % fpm(1)=temp(1);%xe
  % fpm(2)=temp(2);
  % fpm(3)=temp(3);
  % fpm(4)=temp(4);
  temp=ye*transpose(x);
  fpm(5:20)=reshape(temp,[1,16]);%ip
  % fpm(5)=temp(1,1); fpm(6)=temp(2,1); fpm(7)=temp(3,1); fpm(8)=temp(4,1); fpm(9)=temp(1,2); fpm(10)=temp(2,2); fpm(11)=temp(3,2);
  % fpm(12)=temp(4,2); fpm(13)=temp(1,3); fpm(14)=temp(2,3); fpm(15)=temp(3,3); fpm(16)=temp(4,3); fpm(17)=temp(1,4); fpm(18)=temp(2,4);
  % fpm(19)=temp(3,4); fpm(20)=temp(4,4); 
  temp=ye*transpose(r);
  fpm(21:28)=reshape(temp,[1,8]);%ipm
  % fpm(21)=temp(1,1); fpm(22)=temp(2,1); fpm(23)=temp(3,1); fpm(24)=temp(4,1); fpm(25)=temp(1,2); fpm(26)=temp(2,2); fpm(27)=temp(3,2);
  % fpm(28)=temp(4,2);
  temp=Am*xm+Bm*r;%xm
  fpm(29)=temp(1);
  fpm(30)=temp(2);
  fpm(31)=temp(3);
  fpm(32)=temp(4);
  fpm=transpose(fpm);
  t
end



% function fpm = F_PEMA(t,dynamic,qd1,qd2) 
%   xe=[dynamic(1);dynamic(2);dynamic(3);dynamic(4);];
%   xm=[dynamic(29),dynamic(30),dynamic(31),dynamic(32)];
%   x=xm-xe;
%   ip=dynamic(5:20);
%   ip=reshape(ip,[4,4]);
%   ipm=dynamic(21:28);
%   ipm=reshape(ipm,[4,2]);
%   qd=[qd1(t); qd2(t);];
%   r=qd;
%   Ce=eye(4);
%   ye=Ce*xe;
%   we=We_calc(x,r,ye,ip,ipm);
%   temp=Am*xe+we;  
%   fpm(1)=temp(1);%xe
%   fpm(2)=temp(2);
%   fpm(3)=temp(3);
%   fpm(4)=temp(4);
%   temp=ye*transpose(x);
%   fpm(5:20)=reshape(temp,[16,1]);%ip
%   temp=ye*transpose(r);
%   fpm(21:28)=reshape(temp,[8,1]);%ipm
%   temp=Am*xm+Bm*r;%xm
%   fpm(29)=temp(1);
%   fpm(30)=temp(2);
%   fpm(31)=temp(3);
%   fpm(32)=temp(4);
% end


% function fpm = F_PEMA(t,dynamic,qd1,qd2) 
%   x=[dynamic(1);dynamic(2);dynamic(3);dynamic(4);];
%   xm=[dynamic(29);dynamic(30);dynamic(31);dynamic(32)];
%   xe=xm-x;
%   ip=dynamic(5:20);
%   ip=reshape(ip,[4,4]);
%   ipm=dynamic(21:28);
%   ipm=reshape(ipm,[4,2]);
%   qd=[qd1(t); qd2(t);];
%   r=qd;
%   Am=[0 0 1 0;0 0 0 1;-16 0 -8 0;0 -16 0 -8;];
%   Bm=[0 0;0 0;16 0;0 16;];
%   B=eye(4);
%   Q=eye(4);
%   Ce=transpose(B)*lyap(transpose(Am),Q);
%   ye=Ce*xe;
%   u=u_calc(x,r,ye,ip,ipm);
%   % temp=A*x+B*u;  
%   H=Inertia_Matrix(x);
%   C=Centrifuge_Matrix(x);
%   G=Gravity_Matrix(x);
%   invH=inv(H);
%   temp=-invH*C*[x(3);x(4);]-invH*G+invH*u;
%   fpm(1) =x(3);
%   fpm(2)=x(4);
%   fpm(3)=temp(1);
%   fpm(4)=temp(2);
%   % fpm(1)=temp(1);%xe
%   % fpm(2)=temp(2);
%   % fpm(3)=temp(3);
%   % fpm(4)=temp(4);
%   temp=ye*transpose(x);
%   fpm(5:20)=reshape(temp,[1,16]);%ip
%   temp=ye*transpose(r);
%   fpm(21:28)=reshape(temp,[1,8]);%ipm
%   temp=Am*xm+Bm*r;%xm
%   fpm(29)=temp(1);
%   fpm(30)=temp(2);
%   fpm(31)=temp(3);
%   fpm(32)=temp(4);
%   fpm=transpose(fpm);
%   t
% end