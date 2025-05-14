function G = Gravity_Matrix(x)
m1=10;
m2=8;
l1=0.5;
l2=0.4;
g=9.81;
lc1r=0.25;
lc2r=0.1;
I1r=0.23;
I2r=0.2;
G=[m2*lc2r*g*cos(x(1)+x(2))+(m2*l1+m1*lc1r)*g*cos(x(1)); m2*lc2r*g*cos(x(1)+x(2))];


end