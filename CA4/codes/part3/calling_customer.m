function calling_customer(s,b,mapSet)
y=mapSet{1,30};
if(s<=20 || s==30 || s==40 || s==50 || s==60 || s==70 || s==80 || s==90)
    name=num2str(s);
    index = find(strcmp(mapSet(2, :), name));
    y=cat(1, y,mapSet{1,index});
else
    firstDigit = mod(abs(s), 10);
    s=s-firstDigit;
    name1=num2str(s);
    firstIndex=find(strcmp(mapSet(2, :), name1));
    y=cat(1,y,mapSet{1,firstIndex});    
    y=cat(1,y,mapSet{1,28});
    y=cat(1,y,mapSet{1,firstDigit});
end
y=cat(1,y,mapSet{1,29});
y=cat(1,y,mapSet{1,b});
sound(y,mapSet{3,1});
end