
%Q1
s=tf('s');
zeta=0.59;
Css=1.5/s;
Ms=10^-1;
Ms_db=20*log10(Ms);
Tp=1.05;
Tp_db=20*log10(Tp);
Sp=1.36;
Sp_db=20*log10(Sp);
wc=4.8/5;
G=0.3/(s^2+1.75*s+0.37);
L_1=Css*G;

wy_des=0.08*10;



ph_1=abs(-198+107.5);
ph_2=abs(-198+123.2);
phi=(ph_1+ph_2)/2;
wnorm=4;
wz=wc/wnorm;
Cz=1+s/wz;
L_2=L_1*Cz;

mi=10^(1.8/20);
wi=wc/(10*mi);

Ci=(1+s/(mi*wi))/(1+s/wi);
L_3=L_2*Ci;

C=Ci*Cz*Css;
tc=500;

figure(1);
nichols(L_3), hold on;
S_grid(Sp_db);
T_grid(Tp_db);
S_grid(Ms_db);

out=sim('feedback_simulation1');


