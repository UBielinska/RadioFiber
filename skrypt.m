clear all;
load('data.mat');opdata=normalize(data_aq,'range',[-1 1]);
load('data_el');eldata=normalize(data_aq,'range',[-1 1]);
clear data_aq;
%%
fitleredeldata = filter(filtel,eldata);
rsampled=resample(fitleredeldata(24:end),1,50);
idealdata=sign(rsampled);
%%
afterbp=filter(filtbp,opdata);
hlbt=abs(hilbert(afterbp-mean(afterbp)));
fltopt = normalize(filter(filtel,hlbt),'range',[-1 1]);
%%
rsampledopt=resample(fltopt(41:end),1,50);
signedsig=sign(rsampledopt);
d = finddelay(signedsig,idealdata);
sig = circshift(signedsig, d);
%%
max(sig(167:end)-idealdata(167:end))