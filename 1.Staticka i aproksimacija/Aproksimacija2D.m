x=-4:0.01:4; %vrijem
y=exp(-2*sin(x).^2).*sin(5*x); 
ys=y+0.05*randn(size(x));   

net=newff([-4,4],[30,1],{'tansig','purelin'}, 'traincgf');

%definiranje parametara
net.trainParam.epochs=1000;
net.trainParam.show=10;
net.trainParam.lr=0.05;
net.trainParam.goal=1e-3; 

%treniranje nm
[net,tr]=train(net,x,ys);
a=sim(net,x);

%prikaz 
subplot(311)
plot(x,y,x,ys, ':r', 'linewidth',2);
xlabel('x-osa')
ylabel('y-osa')
legend('Signal','Signal sa ?umom');

subplot(312)
plot(x,ys,x,a, 'b', 'linewidth',2);
xlabel('x-osa')
ylabel('y-osa')
legend('Signal sa sumom','Neuronska mre?a');

subplot(313)
plot(x,y,x,a, ':g', 'linewidth',2);
xlabel('x-osa')
ylabel('y-osa')
legend('Signal','Neuronska mre?a');