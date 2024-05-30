function [R2, V2, R1, V1] = calculateR_V(signal, fc, fs, beta)
    C = 3e8; 
    Y = fft(signal);
    N = length(Y);
    P2 = abs(Y/N);
    P1 = P2(1:N/2+1);
    P1(2:end-1) = 2*P1(2:end-1);  
    f = fs*(0:(N/2))/N;  
    phase = angle(Y(1:N/2+1));

    [mag_peaks, peak_indices] = maxk(P1, 2);
    
    f_peak1 = f(peak_indices(1));
    f_peak2 = f(peak_indices(2));

    phase_peak1 = phase(peak_indices(1));
    phase_peak2 = phase(peak_indices(2));

    fd1 = f_peak1 - fc;
    fd2 = f_peak2 - fc;
    td1 = -phase_peak1 / (2 * pi * (fc + fd1));
    td2 = -phase_peak2 / (2 * pi * (fc + fd2));
    if td1 < 0
        td1 = td1 + fs;
    end
    if td2 < 0
        td2 = td2 + fs;
    end
    V2 = fd1 / beta;
    V1 = fd2 / beta;
    R2 = td1 * C / 2;
    R1 = td2 * C / 2;
end