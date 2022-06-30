net = newff(minmax(P'), [10 1], {'tansig', 'purelin'});

net.trainParam.goal = 0;     % Ciljna performansa
net.trainParam.show = 10;    % Frequency of progress 					    displays (in epochs).
net.trainParam.epochs = 200; % Maximum number of epochs

[net,tr]=train(net,P',T');       
gensim(net);
