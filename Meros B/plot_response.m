function plot_response(y0,K,T,r)
title_time='Χρονική απόκριση κατστάσεων';
title_phase='Απόκριση καταστάσεων στο φασικό επίπεδο';
title_y='Χρονική απόκριση εξόδου y και εισόδου αναφοράς r';
tspan = [0 5];
syms tx
diff_r(tx)=diff(r,tx);
x0=double([r(0) diff_r(0)]-y0); %because e=r-y kai r(0)=2 h r(0)=0 symvatika???
[t,x] = ode45(@(t,x) F_Et(t,x,K,T,r), tspan, x0);
figure;
 subplot(2,2,1)
plot(t,x,'-o')
legend('x1','x2')
xlabel('t','FontSize',12,'FontWeight','bold')
ylabel('State','FontSize',12,'FontWeight','bold',"Rotation",0)
title(title_time)
hold on;
    subplot(2,2,2)
x1=x(:,1);
x2=x(:,2);
plot(x1,x2,'o')
xlabel('x1','FontSize',12,'FontWeight','bold')
ylabel('x2','FontSize',12,'FontWeight','bold',"Rotation",0)
title(title_phase)
grid on;
y=r(t)-x(:,1);
    subplot(2,2,[3 4])
plot(t,y,t,r(t));
xlabel('t','FontSize',12,'FontWeight','bold')
ylabel('y','FontSize',12,'FontWeight','bold',"Rotation",0)
title(title_y)
legend('y(t)','r(t)')
hold on;
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 20 20]); 
y01s=strrep(num2str(y0(1)),'.','d');
y02s=strrep(num2str(y0(2)),'.','d');
df0=double(diff_r(0));
if (df0==0)
    title_r='2ru';
else    
    title_r=strcat(strrep(num2str(df0),'.','d'),'rr');
end
titlesave=strcat(y01s,'_',y02s,'_',title_r);
saveas(gcf, fullfile('C:\Users\george theologis\Desktop\ΠΑΝΕΠΙΣΤΗΜΙΟ\7ο ΕΞΑΜΗΝΟ\Συστήματα Αυτόματου Ελέγχου ΙΙΙ\Εργασια Σαε\plots', titlesave), 'epsc');
end