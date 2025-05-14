function H = Inertia_Matrix(x)
m1=10;
m2=8;
l1=0.5;
l2=0.4;
g=9.81;
lc1r=0.25;
lc2r=0.1;
I1r=0.23;
I2r=0.2;
h11=m1*lc1r^2+m2*(lc2r^2+l1^2+2*l1*lc2r*cos(x(2)))+I1r+I2r;
h12=m2*lc2r*(lc2r+l1*cos(x(2)))+I2r;
h22=m2*lc2r^2+I2r;
H=[h11 h12; h12 h22;];
end