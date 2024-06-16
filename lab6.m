%%LAB 6
s=tf('s');
Css=5;
zeta=abs(log(0.085))/sqrt(pi^2+log(0.085)^2);
Tp=1.04;
Sp=1.33;
Tp_db=20*log10(Tp);
Sp_db=20*log10(Sp);
wc=4.5/0.75;
G=10/(s*(s+5)*(s+10));
L_1=Css*G;


delta_phi=abs(-171+105.94);

md=6;
wnorm=0.9;
wd=wc/wnorm;
Cd=((1+s/wd)/(1+s/(md*wd)))^2;

L_2=Cd*L_1;



Ky=10^(18.5/20);

L_3=L_2*Ky;

figure(1);
nichols(L_3), hold on;
T_grid(Tp_db);
S_grid(Sp_db);

C=Css*Cd*Ky;

tc=10;
out=sim('feedback_simulation1');