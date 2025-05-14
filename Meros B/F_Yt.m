function fyt = F_Yt(t,y,K,T,r)
  fyt = zeros(2,1);
  fyt(1) = y(2);
  fyt(2) = -K*y(1)/T-y(2)/T+r(t)*K/T;
end