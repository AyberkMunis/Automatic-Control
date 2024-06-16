s=tf('s');
Css=5/s;
G=2/((1+0.2*s)*(1+0.1*s));
zeta=0.36;
Tp=1.46;
Sp=1.76;
L_1=G*Css;
Tp_db=20*log10(Tp);
Sp_db=20*log10(Sp);
wc=6.1;




deltaphi=abs(-171+136.75);

md=10;
wnorm=0.9;
wd=wc/wnorm;

Cd=(1+s/wd)/(1+s/(wd*md));

L_2=L_1*Cd;
figure(1);
nichols(L_2), hold on;
S_grid(Sp_db);
T_grid(Tp_db);

C=Cd*Css;
tc=3;
out=sim('feedback_simulation1');