s=tf('s');
Gd = 10/(s+1);
G=20/((s+1)*((s/20)^2+(s/20)+1));
wc = 10;
bode(Gd)


%[a,b,c,d]=margin(Gd);
omega = 200;
zeta = 0.8;
Fy =inv(G)*(wc/s) * (omega^2/(s^2 + 2*omega*zeta*s + omega^2));
step(Gd/(1+G*Fy))

%%
K=1;
s=tf('s');
Gd = 10/(s+1);
G=20/((s+1)*((s/20)^2+(s/20)+1));

wc = 10;
w_I=4.7;
delta = 0.25;
K=0.9;
tau=0.2;


Fy  =(1/2)*K*(s+w_I)/s *(s+1+delta)/(s+1);
Fr = 1/(1+tau*s);

step(Gd/(1+Fy*G),3);
hold on 
plot([0.5 0.5],[1.2 -0.2],'r--')
plot( [0 3], [0.1 0.1], 'b--')
plot( [0 3], [-0.1 -0.1], 'b--')
hold off
stepinfo(G*Fy*Fr/(1+Fy*G))

figure;
d_To_u=Fy*Gd*(1)/(1+Fy*G);
step(d_To_u)
hold on
r_To_u = Fy*Fr*(1)/(1+Fy*G);
step(r_To_u)
figure;
bode(1/(1+Fy*G))
figure;
bode(1- 1/(1+Fy*G) )

figure;
step((Fr*Fy*G)/(1+G*Fy))
