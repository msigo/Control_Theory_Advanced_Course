sysmp = minphase;
[A, B, C, D] = ssdata(sysmp);
statespace = ss(A, B, C, D);
statespace = minreal(statespace);

[num, den] = tfdata(statespace);
G = tf(num, den);
G = minreal(G);

%% 3.1.2
p11 = pole(G(1, 1));
p12 = pole(G(1, 2));
p21 = pole(G(2, 1));
p22 = pole(G(2, 2));
z11 = tzero(G(1, 1));
z12 = tzero(G(1, 2));
z21 = tzero(G(2, 1));
z22 = tzero(G(2, 2));

pG = pole(G);
zG = tzero(G);

%% 3.1.3
[SV,W] = sigma(G);
H_inf = max(max(SV));%% borde vara såhär iaf.

%% 3.1.4
G_0 = evalfr(G, 0);
rga_G_0 = G_0.*pinv(G_0)';

%% 3.1.5
figure;
subplot(2, 2, 1);
step(G(1, 1));
title('input 1 to output 1');
subplot(2, 2, 3);
step(G(2, 1));
title('input 1 to output 2');
subplot(2, 2, 2);
step(G(1, 2));
title('input 2 to output 1');
subplot(2, 2, 4);
step(G(2, 2));
title('input 2 to output 2');