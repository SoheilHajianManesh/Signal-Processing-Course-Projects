mapSet = cell(3, 30);

for i = 1:20
    filename = sprintf('%d.wav', i);
    name=sprintf('%d',i);
    [waveform, fs] = audioread(filename);
    mapSet{1, i} = waveform;
    mapSet{2, i} = name;
    mapSet{3, i} = fs;
end
k=21;
j=30;
while(k<28)
    filename = sprintf('%d.wav', j);
    name=sprintf('%d',j); 
    [waveform, fs] = audioread(filename);
    mapSet{1,k}=waveform;
    mapSet{2,k}=name;
    mapSet{3,k}=fs;
    j=j+10;
    k=k+1;
end
[o, fsO] = audioread('o.wav');
mapSet{1,28}=o;
mapSet{2,28}='o';
mapSet{3,28}=fsO;
[b, fsB] = audioread('bebajeye.wav');
mapSet{1,29}=b;
mapSet{2,29}='b';
mapSet{3,29}=fsB;
[s, fsS] = audioread('shomareye.wav');
mapSet{1,30}=s;
mapSet{2,30}='s';
mapSet{3,30}=fsS;
calling_customer(19,3,mapSet);
