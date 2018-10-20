clear all
disp('Pocetak')
Pc=input('Unesi vrijednost vjerojatnosti komunikacije za�titarske slu�be: Pc = ');
Tg=input('Unesi vrijednost vremena reakcije za�titarske slu�be: Tg = ');
Sigma_Tg=input('Unesi vrijednost standardne devijacije vremena reakcije za�titarske slu�be: sigma_Tg = ');
N=input('Unesi vrijednost broja prepreka na putu: N = ');

disp('Unos vektora vrijednosti Ti, Sigma_Ti, Pdi i Li')

Ti=input('Unesi vremena zadr�avanja napada�a na svakoj prepreci du� puta: Ti= ' );
Sigma_Ti=input('Unesi standardne devijacije vremena zadr�avanja napada�a na svakoj prepreci du� puta: Sigma_Ti= ' );
Pdi=input('Unesi vrijednosti vjerojatnosti detekcije na svakoj prepreci du� puta : Pdi= ' );
Li=input('Unesi vrijednosti smjestaja senzora na prepreci Li e {0,1,2}: Li= ');

%provjera unosa
if(length(Ti)~=N || length(Sigma_Ti)~=N || length(Pdi)~=N  || length(Li)~=N)
    error('Krivi unos! Vektori nisu jednake duljine!');
end

br_T=0;
for i=1:N
    for j=i+1:N
        br_T=br_T+Ti(j);
    end
    Tri(i)=Ti(i)*Li(i)/2+br_T;
    br_T=0;
end
disp('Preostalo vrijeme na svakoj prepreci')
Tri
br_SigmaTi=0;
for i=1:N
    for j=i+1:N
        br_SigmaTi=br_SigmaTi+(Sigma_Ti(j))^2;
    end
    Sigma_X(i)=sqrt((Sigma_Ti(i)^2)*(Li(i)/2)^2+br_SigmaTi+Sigma_Tg^2);
    br_SigmaTi=0;
end

for i=1:N
    x(i)=Tri(i)-Tg;
end

for i=1:N
    Pri(i)=0.5*(erfc(-x(i)/(Sigma_X(i)*sqrt(2)))); 
end
disp('Vjerovatnost pravovremene reakcije za�titara na svakoj prepreci')
Pri


%Izracunavanje vjerojatnosti prekida napada - Pi

%%Izracunavanje vjerojatnosti i-tog alarma

for i=1:N
    Pai(i)=Pdi(i)*Pc;
end

zbroj=0;
umnozak=1;
for i=2:N
    for j=1:i-1
        umnozak=umnozak*(1-Pai(j));
    end
    zbroj=zbroj+Pai(i)*Pri(i)*umnozak;
    umnozak=1;
end

Pi=Pai(1)*Pri(1)+zbroj;
disp('Konacno rjesenje za vjerojatnost prekida akcije napada�a')

Pi

   
