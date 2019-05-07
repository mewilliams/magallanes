addpath ~/Research/general_scripts/matlabfunctions/

addpath ~/Research/general_scripts/wavelet-coherence/

clear all;
close all;

load pressure_sensors_raw.mat

figure(1), plot(p_i)
idxi = 1.7E4:3.2E5;
hold all
plot(idxi,p_i(idxi))

figure(2), plot(p_o)
idxo = 6000:3.146E5;
hold all
plot(idxo,p_o(idxo))

Ti = ts_i(idxi);
Pi = p_i(idxi);
To = ts_o(idxo);
Po = p_o(idxo);


figure, plot(Ti,Pi,To,Po), title('usable data')
% return;

%%


t_same = [max([Ti(1);To(1)]):diff(Ti(1:2)):min([Ti(end);To(end)])];

pis = interp1(Ti,Pi,t_same);
pos = interp1(To,Po,t_same);

figure, subplot(211), plot(t_same,[pis;pos]), hold all
plot(t_same,smooth(pis,120),t_same,smooth(pos,120))
subplot(212)
plot(t_same,smooth(pos,120)-smooth(pis,120))
datetick2('x')


%%

% wavelet?
day2sec = 3600*24;
Ti_sec = Ti - min([Ti(1) To(1)]);
Ti_sec = Ti_sec *day2sec;
To_sec = To - min([Ti(1) To(1)]);
To_sec = To_sec *day2sec;


figure('color',[1 1 1])
% tlim=[min(d1(1,1),d2(1,1)) max(d1(end,1),d2(end,1))];
subplot(2,1,1);
wt([To_sec,Po]);
title('Outside');

% set(gca,'xlim',tlim);
subplot(2,1,2)
wt([Ti_sec,Pi])
title('Inside')

xlabel('seconds from start, I hope')
% set(gca,'xlim',tlim)

%%
close all
T_same = max([Ti_sec(1) To_sec(1)]):.5:min([Ti_sec(end) To_sec(end)]); %downsampling to 1 Hz... interpolating
    
Pi_same = interp1(Ti_sec,Pi,T_same);
Po_same = interp1(To_sec,Po,T_same);

data_i = [T_same',Pi_same'];
data_o = [T_same',Po_same'];

figure('color',[1 1 1])
[Wxy,period,scale,coi,sig95] = xwt(data_i,data_o,'pad',1);%,'arrowdensity',10);
title('Cross-Wavelet Transform inside/outside pres. sensor')



figure
wtc(data_i,data_o)
title('wtc: wavelet coherence')