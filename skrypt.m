clear all;
load('data.mat')
opdata=data_aq;
load('data_el')
eldata=data_aq;
clear data_aq;

%filtracja sygna³u analogowego
filtr1 = fir1(51, [13.45/50 17.45/50]);
y = filter(filtr1, 1, opdata);
[up] = envelope(y, 5, 'rms');
low = fir1(51, 2/50);   %filtr dolnoprzepustowy
y = filter(low, 1, up);

%% eldata
P2 = abs(fft(eldata)/length(eldata));
P1 = P2(1:length(eldata)/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = 100e9*(0:(length(eldata)/2))/length(eldata);
semilogy(f,P1) 
title({'eldata'})
xlabel('f (Hz)')
ylabel('|eldata(f)|')
xline(100e9/50,'-','2e9');
%%

%odbiór sygna³u el
dwn = downsample(eldata(38:end),50);
nor = normalize(dwn);
for i= 1:length(nor)
    if nor(i) > 0
        r(i) = 1;
    else
        r(i) = -1;
    end
end
up2 = upsample(r, 50,1);

%usuniêcie przesuniêcia
d = finddelay(up2,y);
syg = circshift(up2, d);
%op = finddelay(cs,y)

y_nor=normalize(y);
syg_nor = normalize(syg);

figure()
plot(syg_nor)
hold on 
plot(y_nor)
