P=out.y(:, 1);
T = out.y(:, 2);
vel = length(P);
minulaz = min(P); 
maxulaz = max(P);
minizlaz = min(T); 
maxizlaz = max(T);
p= 2*(P - minulaz)./(maxulaz - minulaz) - 1;
t = 2*(T - minizlaz)./(maxizlaz - minizlaz) - 1;
N=2;
p=p;
t=t;

for k = N+1 : vel
    t1 = flipud(t(k-N:k-1));
    p1 = flipud(p(k-N:k-1));
    ulaz(:,k) = [t1; p1];
    izlaz(k) = t(k)';
end
 
net = newff([-1 1;-1 1;-1 1;-1 1;],[15 1],{'tansig', 'purelin'}, 'trainlm');

net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-4;
net.trainParam.show = 100;
net.trainParam.time = Inf;
net.performFcn='sse';

tic
net = train(net, ulaz, izlaz);
toc

izlaz=sim(net,ulaz);
izlaz=(izlaz+1)*(maxizlaz-minizlaz)./2 +minizlaz;

subplot(2,1,1),plot(out.y(:,1));
title('Izlaz sistema');
subplot(2,1,2),plot(izlaz,'r')
title('Mreza');
gensim(net)