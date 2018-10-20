function F=funkcija(hc,r,fi,gama,K,H)

F=fi-arcsind((hc*sind(r)/(sind(90-45+fi/2+gama)))/(K*(H/(cosd(45-fi)))));