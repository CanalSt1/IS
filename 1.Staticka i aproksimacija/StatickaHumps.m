x=0:0.05:2; %vrijeme
y=humps(x); %funkcija

plot(x,y,'x');
grid ON
%kreiranje neuronske mreže
net=newff([0 2],[5,1],{'tansig','purelin'},'traingd');
%definiranje parametara mreže
net.trainParam.epochs=1000;
net.trainParam.show=10;
net.trainParam.lr=0.05;
net.trainParam.goal=1e-3; 
%treniranje neuronske mreže
net1=train(net,x,y);
%pohrana vrijednosti - simulacija
a=sim(net1,x);

%iscrtavanje rezultata i poredenje
plot(x,a,'r',x,y,'g');
legend('neuronska mreza','humps funkcija');