load('data.mat')
filtr1 = fir1(51, [13.45/50 17.45/50]);
y = filter(filtr1, 1, data_aq);
[up, lo] = envelope(y);
[up] = envelope(y, 5, 'rms');
low = fir1(51, 2/50);   %filtr dolnoprzepustowy
y = filter(low, 1, up);
%c = abs(fft(y));
%semilogy(c)
%plot(y)
cinit = 11;
prbs = nrPRBS(cinit, 2047);
us = upsample(prbs, 50);
% plot(xcorr(y, us))

