%%LAB 5

%%Q1
%%a
s=tf('s');
G=1/(1+s)^2;
C=(1+s)^2/(s+s^2/4);
R=C/(1+G*C);
r=1/s;
u=R*r;
H=zpk(minreal(u,1e-3));
[num,dem]=tfdata(H,'v');
[r,p]=residue(num,dem);

%%b

%%G should be minimal and strictly proper
%%C should be minimal and proper
%Then well posed

%Minimal Durumu birbirini götüren köklerin sadeleştiği durumdur.
%Polinomun en sade halidir. Aşağıdaki durumlar minimal durumda test edilir

%Strictly proper, paydanın en büyük üstünün payın en büyük üstünden büyük
%olduğu durumdur.

%Strictly proper, paydanın en büyük üstünün payın en büyük üstünden büyük
%ve eşit olduğu durumdur.

%Minimal Durumu birbirini götüren köklerin sadeleştiği durumdur.
%Polinomun en sade halidir


%%G ve C yi test ettiğimizde iki koşulu da sağlamaktadır. Bundan ötürü Bu
%%feedback sistemi well posedur.

%%c
%% Stability için ise ilk L=G*C transfer fonsiyonunun pozitif reel köklerinin
%% sadeleşip sadeleşmediğine bakıyoruz. Eğer sadeleşiyor ise unstable durumu oluşur

%% Negatif kökler sadeleşiyor ya da herhangi bir kök sadeleşmiyor ise
%% PaydaG*PaydaC+PayG*PayC polinomunun strictly negative (r<0) reel kısmı olup olmadığına bakıyoruz.
%% Eğer tüm kökler strictly negative ise stabildir, değil ise unstable durumu oluşur

payda=(s+1)^2*(s+s^2/4);
pay=(s+1)^2*1;

%%s^4 + 6 s^3 + 13 s^2 + 12 s + 4
  %-------------------------------
                % 4
roots([1 6 13 12 4]) ;
%%girdiler her ifadenin katsayısı ör. s^4 1 6s^3 6

%%d

%%• N = number of encirclements of the Nyquist diagram of L(s) around (-1 , j0)
%%P = number of poles of L(s) with real part > 0
L=G*C;
pole(L);
nyquist(L);


%%e

S=1/(1+G*C);
pole(L);
u_bar=0.5;
w0=1;

[mag,phi]=bode(S,w0);

phi_rad=phi/180*pi;
y_bar=mag*u_bar;


%%7

T=(G*C)/(1+G*C);
Y=3*T+2*S;
pole(Y);%%for bibo

u_bar=1;
K=dcgain(Y)*u_bar;

%%Q3

%%1
L=1/(s*(1+s/2)^3);
pole(L);
nyquist(L);
%%N==P==0

%%2
nichols(L);

%3
[Gm,Pm,a,b]=margin(L);
Gm_db=20*log10(Gm);



