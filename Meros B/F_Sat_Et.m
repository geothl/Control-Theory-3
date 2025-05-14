function fset = F_Sat_Et(t,x,K,T,r,e0,u0)
  syms tx;
  diff_r(tx)=diff(r,tx);
  diff_2_r(tx)=diff(diff_r,tx);
  fset = zeros(2,1);
  fset(1) = x(2);
  fset(2) = -K*saturation(x(1),e0,u0)/T-x(2)/T+diff_2_r(t)+diff_r(t)/T;
end