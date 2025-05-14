function fset = F_Sat_Y(t,y,K,T,r,e0,u0)
  fset = zeros(2,1);
  fset(1) = y(2); %fset(1)=ydot
  fset(2) = K*saturation(r(t)-y(1),e0,u0)/T-y(2)/T;  %y(2)=ydot x(1)=y r(t)-y(1)=e
end