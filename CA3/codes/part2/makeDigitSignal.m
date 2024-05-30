function outSignal=makeDigitSignal(r,c)
    fr=[697 770 852 941];
    fc=[1209 1336 1477];    
    fs=8000;
    Ts=1/fs;
    Ton=0.1;
    Toff=0.1;
    t=0:Ts:Ton;
    y1=sin(2*pi*fr(r)*t);
    y2=sin(2*pi*fc(c)*t);
    y=(y1+y2)/2;
    delaySamples = round(Toff * fs);
    outSignal = [y, zeros(1, delaySamples-1)];
end