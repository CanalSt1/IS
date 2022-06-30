[x,y]=meshgrid(-5:0.1:5, -5:0.1:5);
z=y.^2+x.^2;
surf(x,y,z)
[x,f,m,n,k,v]=ga(@(x) x(2).^2+x(1).^2, 2)
text(x(1),x(2),f,'\leftarrow Minimalna vrijednost', 'Color','red');

%Klasi?an na?in traženja minimuma funkcije 

r=min(z)
disp('Minimum funkcije');
h=min(r)