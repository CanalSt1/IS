p=0:0.5:15;
t=0.25.*(p<=4) + 1.*(p>4 & p<=7) ...
    +(p>7 & p<=9).*(1+(p-7)*0.25) ...
    +(p>9 & p<=11).*(1.5-(p-9).*0.5)...
    +(p>11 & p<=13).*0.5 ...
    +(p>13 & p<=14).*(0.5+(p-13)*0.2)...
    +(p>14 & p<=15).*(0.7-(p-14).*0.7);
P=p;
T=t;
Pseq=con2seq(P);
Tseq=con2seq(T);
net=newelm(minmax(P),[50,1],{'tansig','purelin'}, 'traingdx');
net.trainParam.epochs=3000;
net.trainParam.show=50;
net.trainParam.goal=1e-7;
tic
[net,tr]=train(net,Pseq,Tseq);
toc
a=sim(net,Pseq);
b=cat(2,a{:});
time=1:length(p);
plot(time,t,'b--',time,b,'r')
grid on
title('Rezultati');
xlabel('vrijeme');
ylabel('izlazne vrijednosti')
legend('funkcija','neuronska mreza');