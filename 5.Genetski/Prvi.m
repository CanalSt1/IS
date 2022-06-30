[x,y]=meshgrid(-5:0.1:5, -5:0.1:5);
z=5*x.^2+3*(x+3*y.^2);
surf(x,y,z);

[x,f,m,n,nk,v]=ga(@(x) 5*x(1).^2+3*(x(1)+3*x(2).^2),2); %pokretanje algoritma
text(x(1), x(2), f, '\leftarrow Minimalna vrijednost');

%KLASI?AN NA?IN TRAŽENJA MINIMUMA FUNKCIJE
r=min(z);
clc
disp('Minimum funkcije je');
h=min(r)

