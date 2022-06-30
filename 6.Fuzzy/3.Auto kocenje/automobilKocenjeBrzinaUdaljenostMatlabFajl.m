
f=readfis('automobilKocenjeBrzinaUdaljenost.fis')
a=input('Unesite udaljenost')
b=input('Uesite brzinu')
c=evalfis([a b],f);
disp(['Kocenje je'],str2c)