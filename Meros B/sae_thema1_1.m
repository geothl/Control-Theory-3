function sae_thema1_1()
syms tx
ru(tx)=2+0*tx;
rr(tx)=tx;
K=10;
T=0.5;

plot_response_y([-2 0],K,T,ru); 

% plot_response([-2 0],K,T,ru); 

plot_response_y([1 0],K,T,ru);
% plot_response([1 0],K,T,ru); 


plot_response_y([0 0.5],K,T,ru); 
% plot_response([0 0.5],K,T,ru); 


plot_response_y([2 2],K,T,ru); 
% plot_response([2 2],K,T,ru); 


plot_response_y([2.5 -1],K,T,ru); 
% plot_response([2.5 -1],K,T,ru); 


plot_response_y([1.1 2],K,T,ru); 
% plot_response([1.1 2],K,T,ru); 



plot_response_y([-2 0],K,T,rr); 
% plot_response([-2 0],K,T,rr); 


plot_response_y([1 0],K,T,rr); 
% plot_response([1 0],K,T,rr); 

plot_response_y([0 0.5],K,T,rr); 
% plot_response([0 0.5],K,T,rr); 

plot_response_y([2 2],K,T,rr); 
% plot_response([2 2],K,T,rr); 

plot_response_y([2.5 -1],K,T,rr); 
% plot_response([2.5 -1],K,T,rr); 


plot_response_y([1.1 2],K,T,rr); 
% plot_response([1.1 2],K,T,rr); 
end
