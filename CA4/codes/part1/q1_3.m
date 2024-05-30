mapSet=cell(2,32);
mapSet = {'a' , 'b' , 'c' , 'd' , 'e' , 'f' , 'g' , 'h' , 'i' , 'j' , 'k' , 'l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' ','.',',','!',';','"'};
for i=1:32
    mapSet{2,i}=dec2bin(i-1,5);
end
msg="signal";
% speed=1;
% speed=2;
speed=3;
t=linspace(0,5*strlength(msg)/speed,5*strlength(msg)/speed*100+1);
codedSignal=coded_amp(msg,speed,mapSet);
plot(t,codedSignal);