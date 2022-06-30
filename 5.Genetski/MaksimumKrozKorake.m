period = 0:0.1:10;
funkcija = (3/2)*cos(period);
plot(period, funkcija);
axis([-4 10 -2 2])


%PRVI KORAK SLU?AJNI HROMOSOM
xx = randi([1 length(funkcija)]);

%DRUGI KORAK EVALUACIJA SPOSOBNOSTI
funkcija_sposobnosti_xx = funkcija(xx);
uslov = 1;
zastavica = true;

%PETLJA KOJA OMOGU?AVA VRA?ANJE NA TRE?I KORAK SA SEDMOG
while zastavica == true
    %TRE?I KORAK MUTACIJA, PROMJENA X U X'
    ni = length(funkcija)*rand(1);
    z = randi([-1 1]);
    delta = ni*z;
    xPrim = int8(xx+delta);
    zastavica1 = true;
    while zastavica1==true
        zastavica1 = false
        if xPrim > length(funkcija) || xPrim<=0
             ni = length(funkcija)*rand(1);
    z = randi([-1 1]);
    delta = ni*z;
    xPrim = int8(xx+delta);
            zastavica1 = true
        end
    end
    
    %?ETVRTI KORAK ODRE?IVANJE FUNKCIJE SPOSOBNOSTI OD X'
    funkcija_sposobnosti_xPrim = funkcija(xPrim);
    
    %PETI KORAK ODRE?IVANJE d
    d = funkcija_sposobnosti_xPrim-funkcija_sposobnosti_xx;
    
    %ŠESTI KORAK A) RA?UNANJE P(d)
    T = 0.1;
    p =1+exp(-d/T);
    
    %ŠESTI KORAK B) NOVO Z
    z_novo = randi([0 1]);
    
    %ŠESTI KORAK C) Z_NOVO < P
    if z_novo <p
        xx = xPrim;
    end
    
    %ŠESTI KORAK D) T-ni
    T = T-ni;
    
    %SEDMI KORAK USLOV PREKIDA 
    if uslov == 1000
        zastavica = false;
    end
  
    uslov = uslov +1;
end

koordinata_1 = double(xx)/1000;
koordinata_2 = (3/2)*cos(koordinata_1);
text(koordinata_1, koordinata_2, '\leftarrow Maksimum funkcije');


