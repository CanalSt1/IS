clear all
t=0:0.01:5-0.01;

for i=1:length(t)
    y(i)=funkcija(t(i));
end

plot(t,y)
[x,f]=ga(@funkcija,1);

text(x,f,'\leftarrow Minimalna vrijednost','Color','red','LineWidth',3);
r=min(y)
disp('Minimum funkcije na klasican nacin: ');
h=min(r)

clear all
t=5:0.01:10;

for i=1:length(t)
    y(i)=funkcija(t(i));
end

figure
plot(t,y)
[x,f]=ga(@funkcija,1);

text(x,f,'\leftarrow Minimalna vrijednost','Color','red','LineWidth',3);
r=min(y)
disp('Minimum funkcije na klasican nacin: ');
h=min(r)

clear all
t=10:0.01:11;

for i=1:length(t)
    y(i)=funkcija(t(i));
end

figure
plot(t,y)
[x,f]=ga(@funkcija,1);

text(x,f,'\leftarrow Minimalna vrijednost','Color','red','LineWidth',3);
r=min(y)
disp('Minimum funkcije na klasican nacin: ');
h=min(r)