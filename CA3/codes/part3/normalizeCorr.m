function corrValue=normalizeCorr(x,y)
    a=x.*y;
    a=sum(a);
    a=sum(a);
    
    b=x.*x;
    b=sum(b);
    b=sum(b);
    
    c=y.*y;
    c=sum(c);
    c=sum(c);
    
    corrValue = a/sqrt(b*c);

end