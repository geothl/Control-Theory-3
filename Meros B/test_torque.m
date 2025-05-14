xtest=[0;0;0;0;];
H=Inertia_Matrix(xtest);
C=Centrifuge_Matrix(xtest);
G=Gravity_Matrix(xtest);
invH=inv(H);
temp=-invH*C*[xtest(3);xtest(4);]-invH*G+invH*[71.6130;7.848;]