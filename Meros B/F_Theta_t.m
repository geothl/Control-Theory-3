function f_theta = F_Theta_t(Y,s,Gamma)
f_theta=-inv(Gamma)*transpose(Y)*s;
end