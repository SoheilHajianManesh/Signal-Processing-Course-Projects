function [R,V]=calculateR_V(signal,fc)
    fs=100;
    C=3e8;
    beta=0.3;
    alpha=0.5;
    Y =fft(signal);
    N = length(Y);
    P2 = abs(Y/N);
    P1 = P2(1:N/2+1);
    P1(2:end-1) = 2*P1(2:end-1);

    phase = angle(Y);

    f = fs*(0:(N/2))/N;

    [magnitude_peak, peak_index] = max(P1);

    main_frequency = f(peak_index);
    main_phase = phase(peak_index);

    f_new = main_frequency;   
    phi_new = main_phase; 

    fd_ = f_new - fc;

    td_ = -phi_new / (2 * pi * (fc + fd_));

    R=td_*C/2;
    V=fd_/beta;
end