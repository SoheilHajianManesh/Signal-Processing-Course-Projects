C = 3e8;              
fc = 5;               
beta = 0.3;           
alpha1 = 0.5;         
alpha2 = 0.6;         
fs = 100;             
tStart = 0;
tEnd = 1;            
ts = 1/fs;           
t = tStart:ts:tEnd-ts;

R1 = 250000;          
V1 = 50;              
R2 = 200000;          
V2 = 60;             

fd1 = beta * V1;      
td1 = 2 * R1 / C;  
fd2 = beta * V2;   
td2 = 2 * R2 / C;
received_signal = alpha1 * cos(2 * pi * (fc + fd1) * t - 2 * pi * (fc + fd1) * td1) + ...
                  alpha2 * cos(2 * pi * (fc + fd2) * t - 2 * pi * (fc + fd2) * td2);
[R2_estimated, V2_estimated, R1_estimated, V1_estimated] = calculateR_V2(received_signal, fc, fs, beta);

fprintf('Estimated Values:\n');
fprintf('R1: %.2f m\n', R1_estimated);
fprintf('V1: %.2f m/s\n', V1_estimated);
fprintf('R2: %.2f m\n', R2_estimated);
fprintf('V2: %.2f m/s\n', V2_estimated);