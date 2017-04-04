sysmp = minphase;
[A, B, C, D] = ssdata(sysmp);
statespace = ss(A, B, C, D);
statespace = minreal(statespace);

[num, den] = tfdata(statespace);
G = tf(num, den);
G = minreal(G);
s = tf('s');

%% 3.2.1
% 10 degrees extra gives exactly 60° phase margin for L22, 
%could be decreased a little bit for L11 if we want to.
p_m = pi/3+ (pi/180)*10; 
w_c=0.1;
arg_G = angle(evalfr(G,w_c*1i));

T1 = 1/w_c * atan(-pi/2 - arg_G(1,1) + p_m);
T2 = 1/w_c * atan(-pi/2 - arg_G(2,2) + p_m);

l11 = G(1,1) * (1 + (1/(s*T1)));
l22 = G(2,2) * (1 + (1/(s*T2)));

K1 = 1 / (abs(evalfr(l11,w_c*1i)));
K2 = 1 / (abs(evalfr(l22,w_c*1i)));

f1 = K1*(1 + (1/(s*T1)));
f2 = K2*(1 + (1/(s*T2)));
F = [f1 0 ; 0 ,f2];

L = G * F;

bode(L(1,1))
figure;
bode(L(2,2))

%% 3.2.2

S = inv(eye(2) + G * F);
T = S * G * F;

[Ssv, Sw] = sigma(S);
[Tsv, Tw] = sigma(T);

sigma(S)
title('S')
figure;
sigma(T)
title('T')












