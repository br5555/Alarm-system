function [ alfa, beta, fi, W, L, wd ] = f1( H,D,S,f,hc,hmin)
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
     ALFA= 2*atan(a/(2*f));            
     BETA= 2*atan(b/(2*f));            
     alfa= 2*atan(a/(2*f))*180/pi;    
     beta= 2*atan(b/(2*f))*180/pi;
     fi1=atan((H-hc)/D)*180/pi;
     fi=beta/2+fi1;
     fi2=90-fi1;
     fi3=fi2-beta;
     fi3_rad=fi3*pi/180;
     L=(H-hmin)*tan(fi3_rad);
     HOR1=sqrt((D^2+(H-hc)^2));
     delta=2*atan(tan(ALFA/2)*cos(BETA/2));
     W=2*HOR1*tan(delta/2);
     HOR2=sqrt((L^2+(H-hmin)^2));
     wd=2*HOR2*tan(delta/2):

end

