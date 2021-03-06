P = out.y(:,1);
T = out.y(:,2);
minulaz = min(P);
maxulaz = max(P);
minizlaz = min(T);
maxizlaz = max(T);
N = 4;
net = newff([zeros(2*N,1)-1 zeros(2*N,1)+1],[15 5 1],{'tansig','tansig','purelin'},'trainlm');
net.trainParam.epochs = 1000;
net.trainParam.time = Inf;
net.trainParam.show =  100;
net.trainParam.goal = 1e-4;

P = P./abs(maxulaz);
T = T./abs(maxizlaz);

vel = length(T);
ulaz = zeros(2*N,vel-N);
izlaz = zeros(1,vel-N);
for k = N:vel-1
    t = flipud(T(k-N+1:k+1));
    p = flipud(P(k-N+1:k-1));
    ulaz(:,k)=[t;p];
    izlaz(k) = P(k);
end
net = train(net,ulaz,izlaz);
izlaz = sim(net,ulaz);
izlaz = (izlaz+1).*(maxulaz-minulaz)./2 + minulaz;

figure
subplot(2,1,1),plot(out.y(:,1));
title('Izlazni podaci iz sistema');
xlabel('uzorci')
ylabel('amplituda')
subplot(2,1,2),plot(izlaz,'r')
title('Podaci dobiveni sa treniranom mrežom');
xlabel('uzorci')
ylabel('amplituda')
gensim(net,0.1)

% 2*(u(1)-minizlaz)/(maxizlaz-minizlaz)-1
% 2*(u(1)-minizlaz)/(maxizlaz-minizlaz)-1
% 2*(u(1)-minulaz)/(maxulaz-minulaz)-1
% (u(1)+1)*(maxulaz-minulaz)/2+minulaz