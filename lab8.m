
%Q1

s=tf('s');
k=2;

css=k/s;

zeta=0.455;
tp=1.23;
sp=1.54;
mt=0.01/0.1;
mt=20*log10(mt);
tp=20*log10(tp);
sp=20*log10(sp);
trwc=1.875;
tr=0.3;

wc=trwc/tr;
g=40/((s^2+4*s-9.81)*(1+0.001*s));
cpid=10*(1+s/4);
l1=g*css;


phi_1=243-132.05;
phi_2=243-125.61;
phi=(phi_1+phi_2)/2;

wnorm=2.7;
wz=wc/wnorm;
Cz=(1+s/wz)^2;
l2=l1*Cz;

k=10^(2/20);
l3=k*l2;
wp=17*wz ;
cp=1/(1+s/wp);
l4=l3*cp;

C=css*cp*Cz;
figure(1);
nichols(l4), hold on;
S_grid(sp);
T_grid(tp);
T_grid(mt);

tc=100;
out=sim('feedback_simulation2');

