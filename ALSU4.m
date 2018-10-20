


gama=atand(H/D);
beta=2*fi;
z=90-fi;
r=90-gama;
i=180-z;
theta=90-(z/2);
j=180-theta-gama;
k=180-j;
M=hc*sind(r)/(sind(k));

x=A/(2*sind(fi));
g=90-(z/2);
c=90-g;
x1=H*(sind(c))/(sind(g));
x2=D-x1;
***************************************
y1=H*sind(c)/(sind(theta));
deltax=y1-x1;
y2=deltax+x2;

y3=y2*sind(j)/(sind(gama));
y4=deltax/(sind(z/2));
x3=y3-y4;
S = solve(((A+y4)*y2/(M+y3))^2+(hc*(A+y4)/(M+y3))^2=(A+y4)^2,A);
********************************


