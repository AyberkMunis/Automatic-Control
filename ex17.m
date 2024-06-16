s=tf('s');
Css=34/s;
zeta=0.59;
Tp=1.05;
Sp=1.37;
Tp_db=20*log10(Tp);
Sp_db=20*log10(Sp);
wc_1=1.96/2;
wc_2=3.7/4;
wc=1;
G=0.045/(s^2+2.6*s+1.2);
L_1=Css*G;

ph1=abs(-176+123);
ph2=abs(-176+108);
phi=mean(ph1,ph2);
wnorm=1.5;
wz=wc/wnorm;
Cz=1+s/wz;
L_2=L_1*Cz;


figure(1);
nichols(L_2), hold on;
S_grid(Sp_db);
T_grid(Tp_db);
tc=10;
mi=10^(0.2/20);
wi=wc/(10*mi);
Ci=(1+s/(wi*mi))/(1+s/wi);
C=Cz*Css*Ci;

out=sim('feedback_simulation1');


