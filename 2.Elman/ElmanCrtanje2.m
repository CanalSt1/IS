x = 0:0.1:15;
f = 0.*(x<2) + 4.*(x==2) + (4+(4/1.5).*(x-2)).*(x>2 & x<=3.5) + (8-(4/1.5).*(x-3.5)).*(x>3.5 & x<=5)...
    + (-7)*(x>5 & x<=7) + (-7+(x-7)*(7/2.5)).*(x>7 & x<=9.5) + (4/2.5).*(x-9.5).*(x>9.5 & x<=12)...
    + (4-(4/3).*(x-12)).*(x>12 & x<=15);
P=x;
T=f;
Pseq=con2seq(P);
Tseq=con2seq(T);
net=newelm(minmax(P),[40,1],{'tansig','purelin'}, 'traingdx');
net.trainParam.epochs=1200;
net.trainParam.show=10;
net.trainParam.goal=1e-5;
tic
[net,tr]=train(net,Pseq,Tseq);
toc
a=sim(net,Pseq);
b=cat(2,a{:});
time=1:length(x);
plot(x,f,'b',x,b,'r');
grid on