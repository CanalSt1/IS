x=-2:0.25:2;
y=-2:0.25:2;
z=cos(x)'*sin(y);

%NM
P=[x;y];        %ulazni interval za 3d funkc 
T=z;

net=newff([-2 2;-2 2],[25 17],{'tansig','purelin'}, 'trainlm');

net.trainParam.show=50;
net.trainParam.lr=0.05;
net.trainParam.epochs=3000;
net.trainParam.goal=1e-3;

net1=train(net,P,T);
a=sim(net1,P);

%a)
subplot(311)
mesh(x,y,z);
xlabel('x-osa')
ylabel('y-osa')
zlabel('z-osa')
title('Model 3D funkcije z')



subplot(312)
mesh(x,y,a);
xlabel('x-osa')
ylabel('y-osa')
zlabel('z-osa')
title('Istrenirana NM za 3D funkciju z')


subplot(313)
mesh(x,y,a-z);
xlabel('x-osa')
ylabel('y-osa')
zlabel('z-osa')
title('Razlika/greška/odstupanje NM mreže i funkcije z')

