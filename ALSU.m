echo on
%H = visina na koji je postavljena kamera [m]
%hmin = visina donje granice vidnog polja kamere [m]
%hc = visina gornje granice vidnog polja kamere [m]
%L = udaljenost donje granice vidnog polja od kamere [m]
%D = udaljenost gornje granice vidnog polja od kamere [m]
%wd = sirina horizontalne projekcije vidnog polja na donjoj visinskoj granici [m] 
%W = sirina horizontalne projekcije vidnog polja na gornjoj visinskoj granici [m] 
%alfa = horizontalni kut vidnog polja
%beta = vertikalni kut vidnog polja
%fi = nagib kamere u odnosu na horizontalu (tlo)
%f = zarisna duljina objekta

%==========================================================================
%poznata zarisna duljina objekta "f"  - slucaj "1"
%poznata sirina horizontalne projekcije vidnog polja na gornjoj visinskoj granici "W" - slucaj "2"
echo off
SLUCAJ=input('');


%ODABRAN SLUCAJ 1
if SLUCAJ==1
    f=input('f = ');

%ODABRAN SLUCAJ 2
elseif SLUCAJ==2
    W=input('W = ');

%ODABRAN NEMOGUÆI SLUÈAJ
else 
error('Odabran nemoguci SLUCAJ!!');
end

echo on
% Molimo upisite ostale parametre kamere
echo off
H=input('H = ');
D=input('D = ');
echo on
% Dimenzije CCD senzora
echo off
S=input('S[x/y"] = ');
         if S == 1/4''
             a=0.0036;
             b=0.0027;
         elseif S == 1/3''
             a=0.0048;
             b=0.0036;
         elseif S == 1/2''
             a=0.0064;
             b=0.0048;
         elseif S == 2/3''
             a=0.0088;
             b=0.0066; 
         else error('SENZOR POGREŠNO ODABRAN!!');
         end 
hc=input('hc = ');
hmin=input('hmin = ');
SLUCAJ=2;
W=8;H=3;hmin=0;hc=4;a=0.0048;D=8;
             b=0.0036;
%==========================================================================
if SLUCAJ==1
     A= 2*atan(a/(2*f));             %alfa u radijanima
     B= 2*atan(b/(2*f));             %beta u radijanima
     alfa= 2*atan(a/(2*f))*180/pi    %alfa u stupnjevima
     beta= 2*atan(b/(2*f))*180/pi    %beta u stupnjevima
     X=atan((H-hc)/D);               
     fi=(X+(B/2))*180/pi             %fi u stupnjevima
     Y=90-(X*180/pi);
     gama=90-Y+beta;
     G=gama*pi/180;
     L=(H-hmin)/tan(G)               %L u metrima
     NI=sqrt((D^2+(H-hc)^2));
     delta=2*atan(tan(A/2)*cos(B/2));
     W=2*NI*tan(delta/2)
     KA=sqrt((L^2+(H-hmin)^2));
     wd=2*KA*tan(delta/2)
     

elseif SLUCAJ==2
     NI=sqrt((D^2+(H-hc)^2));
     delta=2*atan(W/(2*NI));
     B=2*asin(b*tan(delta/2)/a);           %beta u radijanima
     f=b/(2*tan(B/2));
     A=2*atan(a/(2*f));                    %alfa u radijanima
     alfa=2*atan(a/(2*f))*180/pi           %alfa u stupnjevima
     beta=2*asin(b*tan(delta/2)/a)*180/pi  %beta u stupnjevima
     X=atan((H-hc)/D);               
     fi=(X+(B/2))*180/pi             %fi u stupnjevima
     Y=90-(X*180/pi);
     gama=90-Y+beta;
     G=gama*pi/180;
     L=(H-hmin)/tan(G)               %L u metrima
     wd=2*sqrt((H-hmin)^2+L^2) * tan(delta/2)  %wd u metrima
f=f*1000
end
%//////////////////////////////////////////////////////////////////////////




