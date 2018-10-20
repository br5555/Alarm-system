function [ alfa, beta, fi, f, L, wd ] = f2( H,D,S,W,hc,hmin)

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
  end;
     HIPO_ver=sqrt((D^2+(H-hc)^2));
     delta=2*atan(W/(2*HIPO_ver));
     DELTA=delta*180/pi
     BETA=2*asin(b*tan(delta/2)/a);           
     f=b/(2*tan(BETA/2))
     ALFA=2*atan(a/(2*f));                  
     alfa=ALFA*180/pi       
     beta=BETA*180/pi 
     fi1=atan((H-hc)/D)*180/pi;             
     fi=beta/2+fi1        
     fi2=90-fi1;
     fi3=fi2-beta;
     fi3_rad=fi3*pi/180;
     L=(H-hmin)*tan(fi3_rad)           
     wd=2*sqrt((H-hmin)^2+L^2) * tan(delta/2)
     
    
     

end

