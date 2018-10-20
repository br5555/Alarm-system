D=20;
H=3;
hc=1.7;
s=1/3;
Kp=0.5;
hmin=0;

%raèunanje a i b
if s==1/4
   a=3.6;
   b=2.7;
   end
if s==1/3
   a=4.8;
   b=3.6;
   end
if s==1/2
   a=6.4;
   b=4.8;
   end
 if s==2/3
    a= 8.8;
    b=6.6;
 end
 
 %udaljenost do podnožja èovjeka
d1=sqrt(H^2+D^2);

%udaljenost do vrha èovjeka
d2=sqrt((H-hc)^2+D^2);

%kut epsilon
epsilon=acos((d1^2+d2^2-hc^2)/(2*d1*d2));

 %raèunanje kuta beta
 beta=2*atan(tan(epsilon)/(2*Kp));
 
 %raèunanje žarišne duljine f
 f=b/(2*tan(beta/2))
 
 %raèunanje kuta x kako bi smo izraèunali kut fi=beta/2+x
x=atan((H-hc)/D);

%raèunanje kuta fi u stupnjevima
fi=(beta/2+x)*180/pi

%raèunanje kuta alfa
alfa=2*atan(a/(2*f));

%raèunanje delte
delta=2*atan(tan(alfa/2)*cos(beta/2));

%raèunanje širine W
W=2*sqrt(D^2+(H-hc)^2)*tan(delta/2)
 