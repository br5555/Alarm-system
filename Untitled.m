s= 1/3;
if s == 1/3
     a=0.0048;
     b=0.0036;
else error('Nemoguæe');
end

%   D= input ('D= ');
%   H= input ('H= ');
%   h_c= input ('h_c= ');
%   K= input ('K= ');
D=10;
H=3;
hc=2.5;
K=0.2337;
gama=atand(H/D);
r=90-gama;
fi0=[0 0];
[fi,fval] = fsolve(@(fi)funkcija(hc,r,fi,gama,K,H),fi0);
beta=2*fi;
f= b/ (2*tan (beta/2))
  alfa= 2*atan (a/(2*f));
  delta= 2* atan (tan (alfa/2)*cos (beta/2));
  W= 2* x* tan (delta/2)