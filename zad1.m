%[alfa, beta, fi, W, L, wd]=f1(H, D, s, f, hc, hmin)

%unošenje vrijednosti: H, D, s, f, hc, hmin 
syms H D s f hc hmin

%disp ('Unesi vrijednosti H, D, s, f, hc, hmin')

%H=input('H= ');
%D=input('D= ');
%s=input('s= ');
%f=input('f= ');
%hc=input('hc= ');
%hmin=input('hmin= ');

H=3;
D=10;
s=1/3;
f=3.6;
hc=2;
hmin=0.2;


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

%raèunanje vrijednosti: alfa, beta (kutevi u radijanima)

alfa=2*atan(a/(2*f));
beta=2*atan(b/(2*f));

%raèunanje kuta x kako bi smo izraèunali kut fi=beta/2+x
x=atan((H-hc)/D);

%raèunanje kuta fi
fi=(beta/2+x);

%raèunanje duljine L
L=(H-hmin)/tan(beta+x);

%raèunanje delte
delta=2*atan(tan(alfa/2)*cos(beta/2));

%raèunanje širine W
W=2*sqrt(D^2+(H-hc)^2)*tan(delta/2)

%raèunanje širine wd
wd=2*sqrt((H-hmin)^2+L^2)*tan(delta/2)
