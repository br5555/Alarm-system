s= 1/3;
if s == 1/3
     a=0.0048;
     b=0.0036;
else error('Nemoguæe');
end

  D= input ('D= ');
  H= input ('H= ');
  h_c= input ('h_c= ');
  K= input ('K= ');
  *********************
  gama=atand(H/D);
beta=2*fi;
z=90-fi;
r=90-gama;
i=180-z;
theta=90-(z/2);
j=180-theta-gama;
k=180-j;
M=hc*sind(r)/(sind(k));

A=M/K;
*****************
  x= sqrt (D^2+(H-h_c)^2);
  y= sqrt (D^2+H^2);
  kut = acos (x/y);
  M= x* tan (kut);
  A= M/K;
  beta= 2* asin (A/(2*x));
  f= b/ (2*tan (beta/2))
  alfa= 2*atan (a/(2*f));
  delta= 2* atan (tan (alfa/2)*cos (beta/2));
  W= 2* x* tan (delta/2)
  %fi= pi/2 - beta/2 - atan (L/H)
  