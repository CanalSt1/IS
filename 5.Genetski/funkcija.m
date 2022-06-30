function y =funkcija(x)

if(x<5)
    y=sqrt(2*x.^3)-exp(-(sqrt(3.*x)).^2);

elseif(x>=5 && x<=10)
    y=2*x.^2-sqrt(x-1);

else
    y=-exp(x.^2)+(x-2).^2;

end
end