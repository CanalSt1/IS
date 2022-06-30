close all
clc
clear 
x=0:0.1:22; 

if max(x)<=20
    y1=-exp(-(x./20).^2); 
    plot(x,y1); 
    a=min(y1)
    
    [x,f]=ga(@(x) -exp(-x(1)./20).^2,1,[],[],[],[],[0],[20]); 
    x
    f
    
elseif max(x)>20
    y=-exp(-1)+(x-20).*(x+22);
    
    plot(x,y);
    b=min(y)
    [x,f]=ga(@(x) -exp(-1)+(x(1)-20).*(x(1)+22),1,[],[],[],[],[0],[21]);
    x
    f
end

text(x(1),f,'\leftarrow Minimalna vrijednost','FontSize',10,'Color','green','linewidth',2.5)