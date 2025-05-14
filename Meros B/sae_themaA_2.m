
function sae_themaA_2()

syms tx
ru(tx)=2+0*tx;
rr1(tx)=tx;
rr2(tx)=1.5*tx;
rr3(tx)=2*tx;
K=10;
T=0.5;

plot_response_sat_y([-2 0],K,T,ru,0.1,0.15)
plot_response_sat_y([1 0],K,T,ru,0.1,0.15)
plot_response_sat_y([0 0.5],K,T,ru,0.1,0.15)
plot_response_sat_y([2 2],K,T,ru,0.1,0.15)
plot_response_sat_y([2.5 -1],K,T,ru,0.1,0.15)
plot_response_sat_y([1.1 2],K,T,ru,0.1,0.15)

plot_response_sat_y([-2 0],K,T,rr1,0.1,0.15)
plot_response_sat_y([1 0],K,T,rr1,0.1,0.15)
plot_response_sat_y([0 0.5],K,T,rr1,0.1,0.15)
plot_response_sat_y([2 2],K,T,rr1,0.1,0.15)
plot_response_sat_y([2.5 -1],K,T,rr1,0.1,0.15)
plot_response_sat_y([1.1 2],K,T,rr1,0.1,0.15)

plot_response_sat_y([-2 0],K,T,rr2,0.1,0.15)
plot_response_sat_y([1 0],K,T,rr2,0.1,0.15)
plot_response_sat_y([0 0.5],K,T,rr2,0.1,0.15)
plot_response_sat_y([2 2],K,T,rr2,0.1,0.15)
plot_response_sat_y([2.5 -1],K,T,rr2,0.1,0.15)
plot_response_sat_y([1.1 2],K,T,rr2,0.1,0.15)


plot_response_sat_y([-2 0],K,T,rr3,0.1,0.15)
plot_response_sat_y([1 0],K,T,rr3,0.1,0.15)
plot_response_sat_y([0 0.5],K,T,rr3,0.1,0.15)
plot_response_sat_y([2 2],K,T,rr3,0.1,0.15)
plot_response_sat_y([2.5 -1],K,T,rr3,0.1,0.15)
plot_response_sat_y([1.1 2],K,T,rr3,0.1,0.15)


% plot_response_sat([-2 0],K,T,ru,0.1,0.15)
% plot_response_sat([1 0],K,T,ru,0.1,0.15)
% plot_response_sat([0 0.5],K,T,ru,0.1,0.15)
% plot_response_sat([2 2],K,T,ru,0.1,0.15)
% plot_response_sat([2.5 -1],K,T,ru,0.1,0.15)
% plot_response_sat([1.1 2],K,T,ru,0.1,0.15)
% 
% plot_response_sat([-2 0],K,T,rr1,0.1,0.15)
% plot_response_sat([1 0],K,T,rr1,0.1,0.15)
% plot_response_sat([0 0.5],K,T,rr1,0.1,0.15)
% plot_response_sat([2 2],K,T,rr1,0.1,0.15)
% plot_response_sat([2.5 -1],K,T,rr1,0.1,0.15)
% plot_response_sat([1.1 2],K,T,rr1,0.1,0.15)
% 
% plot_response_sat([-2 0],K,T,rr2,0.1,0.15)
% plot_response_sat([1 0],K,T,rr2,0.1,0.15)
% plot_response_sat([0 0.5],K,T,rr2,0.1,0.15)
% plot_response_sat([2 2],K,T,rr2,0.1,0.15)
% plot_response_sat([2.5 -1],K,T,rr2,0.1,0.15)
% plot_response_sat([1.1 2],K,T,rr2,0.1,0.15)
% 
% 
% plot_response_sat([-2 0],K,T,rr3,0.1,0.15)
% plot_response_sat([1 0],K,T,rr3,0.1,0.15)
% plot_response_sat([0 0.5],K,T,rr3,0.1,0.15)
% plot_response_sat([2 2],K,T,rr3,0.1,0.15)
% plot_response_sat([2.5 -1],K,T,rr3,0.1,0.15)
% plot_response_sat([1.1 2],K,T,rr3,0.1,0.15)
end



