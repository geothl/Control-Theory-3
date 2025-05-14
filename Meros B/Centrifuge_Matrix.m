function C = Centrifuge_Matrix(x)
m1=10;
m2=8;
l1=0.5;
l2=0.4;
g=9.81;
lc1r=0.25;
lc2r=0.1;
I1r=0.23;
I2r=0.2;
c11=-m2*l1*lc2r*sin(x(2))*x(4);
c12=-m2*l1*lc2r*sin(x(2))*(x(4)+x(3));
c21=m2*l1*lc2r*sin(x(2))*x(3);
C=[c11 c12; c21 0;];
end