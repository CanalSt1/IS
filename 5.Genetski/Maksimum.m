t=0:0.01:3;
funkcija=(3/2)*cos(t);
plot(t,funkcija);
axis([-4 4 -2 2]);

xx=randi([1 30]);
funkcijasposobnostixx=funkcija(xx);
uslov=1;
zastavica=true;
while zastavica==true
    ni=0.01;
    z=randi([-1 1]);
    delta=ni*z;
    xprim=int8(xx+delta);
    funkcijasposobnostixprim=funkcija(xprim);
    d=funkcijasposobnostixprim-funkcijasposobnostixx;
    T=0.1;
    p=1/1+exp(-d/T);
    z_novo=randi([0 1]);
    if z_novo<p
        xx=xprim;
    end
    T=0.1-0.01;
    if uslov==1000;
        zastavica=false;
    end
    uslov=uslov+1;
end
kordinata1=double(xx)/1000;
kordinata2=(3/2);
text(kordinata1,kordinata2,'\leftarrow max vrijed');

    

