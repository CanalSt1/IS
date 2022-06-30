p= out.t; % vrijeme iz simulinka
t= out.izlaz; %funkcija iz simulinka
P=p; %kreiranje vektora
T=t; %kreiranje vektora

Pseq=con2seq(P);  
Tseq=con2seq(T);  %konverzija konkurentnih vektora u sekvencijalne

net=newelm(minmax(P), [30 10 94], {'tansig', 'tansig', 'purelin'}, 'traingdx'); %kreiranje nove elmanove mreze
net.trainParam.epochs=3000;  % broj iteracija
net.trainParam.show=50;  %broj prikaza
net.trainParam.goal=1e-4;  %greska
    
tic
[net, tr] = train(net, Pseq, Tseq);  %treniranje mreze
toc
    
a = sim(net,Pseq);  %simulacija
b=cat(2,a{:}); % prikaz polja
    
%prikazi grafova:
time=1:length(p);
plot(time,t,'b--', time, b, 'r--');
title("Rezultat trenirane mreze");
xlabel("Vrijeme");
ylabel("Izlazne vrijednosti");
legend('Signal', 'Elmanova NM');