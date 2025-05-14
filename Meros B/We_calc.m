function we = We_calc(x,r,ye,ip,ipm) 
a=[1 1 1 1;1 1 1 1;];
b=[1 1 1 1;1 1 1 1;];
Am=[0 0 1 0;0 0 0 1;-16 0 -8 0;0 -16 0 -8;];
Bm=[0 0;0 0;16 0;0 16;];
H=Inertia_Matrix(x);
C=Centrifuge_Matrix(x);
G=Gravity_Matrix(x);
invH=inv(H);
Ablock11=zeros(2,2);
Ablock12=eye(2);
Ablock21=-invH*G;
Ablock22=-invH*C;
A=[Ablock11 Ablock12;Ablock21 Ablock22;];
B=[0 0;0 0;invH];
KP=a*ip+b*ye*transpose(x);
KPM=a*ipm+b*ye*transpose(r);
u=-KP*x+KPM*r;
we=(Am-A)*x+Bm*r-B*u;
end


