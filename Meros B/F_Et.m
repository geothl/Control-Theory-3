function fet = F_Et(t,x,K,T,r)
  syms tx;
  diff_r(tx)=diff(r,tx);
  diff_2_r(tx)=diff(diff_r,tx);
  fet = zeros(2,1);
  fet(1) = x(2);
  fet(2) = -K*x(1)/T-x(2)/T+diff_2_r(t)+diff_r(t)/T;
end