
%% 30 degrees of phasemargin
s=tf('s');
G=3*(-s+1)/((5*s+1)*(10*s+1));
b=0.5475;
K=(sqrt(b))/0.3505;
wcd=0.4;
tauD=1/(wcd*(sqrt(b)));
tauI=10/wcd;
gamma=0;
Fleadlag30 = K * (tauD*s+1)/(b*tauD*s+1) *(tauI*s+1)/(tauI*s+gamma);

%[a,b]=bode(G,0.4)
bode(Fleadlag30*G/(1+Fleadlag30*G))



%% 50 degrees of phasemargin
s=tf('s');
G=3*(-s+1)/((5*s+1)*(10*s+1));
b=0.2485;
K=(sqrt(b))/0.3505;
wcd=0.4;
tauD=1/(wcd*(sqrt(b)));
tauI=10/wcd;
gamma=0;
Fleadlag50 = K * (tauD*s+1)/(b*tauD*s+1) *(tauI*s+1)/(tauI*s+gamma);

stepinfo(Fleadlag50*G/(1+Fleadlag50*G))
