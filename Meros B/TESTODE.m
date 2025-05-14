clear;
test_4=@(x,u) 1+u;
[t,x,u] = ode45(@(t,x,u) test_4(x,u), [0 10],{0,0});
