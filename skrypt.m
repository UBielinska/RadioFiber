clear all;
load('data.mat')
dane=data_aq;
load('data_el')
a=data_aq;

filtr1 = fir1(51, [13.45/50 17.45/50]);
y = filter(filtr1, 1, data_aq);
[up] = envelope(y, 5, 'rms');
low = fir1(51, 2/50);   %filtr dolnoprzepustowy
y = filter(low, 1, up);

%c = abs(fft(y));
%semilogy(c)
%plot(y)
pr = nrPRBS(11, 2047);
prbss = prbs2(9,11,2047);
us = resample(double(prbss), 50,1);
% figure(1)
% plot(pr)
% hold on
% plot(prbss)

y2=normalize(y,'range');
 plot(xcorr(us, y2))

