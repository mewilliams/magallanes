addpath ~/Research/general_scripts/matlabfunctions



t = datenum(2019,SerMon,SerDay,SerHour,SerMin,SerSec+SerHund/100);

figure(1)
plot(t,AnBTDepthcmB1./100,t,AnBTDepthcmB2./100,t,AnBTDepthcmB3./100,t,AnBTDepthcmB4./100), hold all
meanBT = (AnBTDepthcmB1+AnBTDepthcmB2+AnBTDepthcmB3+AnBTDepthcmB4)./400;
plot(t,meanBT,'k','linewidth',2)

figure(7)

subplot(411), pcolor(t,SerBins,SerPG1'), shading flat, cbax = colorbar; ylabel(cbax,'Percent Good, Beam 1')
hold all, plot(t,meanBT,'k','linewidth',2)
ylabel('depth [m]'), axis ij

subplot(412), pcolor(t,SerBins,SerPG2'), shading flat, cbax = colorbar; ylabel(cbax,'Percent Good, Beam 2')
hold all, plot(t,meanBT,'k','linewidth',2)
ylabel('depth [m]'), axis ij

subplot(413), pcolor(t,SerBins,SerPG3'), shading flat, cbax = colorbar; ylabel(cbax,'Percent Good, Beam 3')
hold all, plot(t,meanBT,'k','linewidth',2)
ylabel('depth [m]'), axis ij

subplot(414), pcolor(t,SerBins,SerPG4'), shading flat, cbax = colorbar; ylabel(cbax,'Percent Good, Beam 4')
hold all, plot(t,meanBT,'k','linewidth',2)
ylabel('depth [m]'), axis ij


datetick2('x')


figure(9)
subplot(411), pcolor(t,SerBins,SerEA1cnt'), shading flat, cbax = colorbar; ylabel(cbax,'Echo Amp., Beam 1')
hold all, plot(t,meanBT,'k','linewidth',2)
ylabel('depth [m]'), axis ij

subplot(412), pcolor(t,SerBins,SerEA2cnt'), shading flat, cbax = colorbar;ylabel(cbax,'Echo Amp., Beam 2')
hold all, plot(t,meanBT,'k','linewidth',2)
ylabel('depth [m]'), axis ij

subplot(413), pcolor(t,SerBins,SerEA3cnt'), shading flat, cbax = colorbar;ylabel(cbax,'Echo Amp., Beam 3')
hold all, plot(t,meanBT,'k','linewidth',2)
ylabel('depth [m]'), axis ij


subplot(414), pcolor(t,SerBins,SerEA4cnt'), shading flat, cbax = colorbar; ylabel(cbax,'Echo Amp., Beam 4')
hold all, plot(t,meanBT,'k','linewidth',2)
ylabel('depth [m]'), axis ij

datetick2('x')


figure(10)
subplot(411), pcolor(t,SerBins,SerC1cnt'), shading flat, cbax = colorbar; ylabel(cbax,'Corr., Beam 1')
hold all, plot(t,meanBT,'k','linewidth',2)
ylabel('depth [m]'), axis ij

subplot(412), pcolor(t,SerBins,SerC2cnt'), shading flat, cbax = colorbar;ylabel(cbax,'Corr., Beam 2')
hold all, plot(t,meanBT,'k','linewidth',2)
ylabel('depth [m]'), axis ij

subplot(413), pcolor(t,SerBins,SerC3cnt'), shading flat, cbax = colorbar;ylabel(cbax,'Corr., Beam 3')
hold all, plot(t,meanBT,'k','linewidth',2)
ylabel('depth [m]'), axis ij


subplot(414), pcolor(t,SerBins,SerC4cnt'), shading flat, cbax = colorbar; ylabel(cbax,'Corr., Beam 4')
hold all, plot(t,meanBT,'k','linewidth',2)
ylabel('depth [m]'), axis ij

datetick2('x')




figure(1)
plot(t,AnBTDepthcmB1./100,t,AnBTDepthcmB2./100,t,AnBTDepthcmB3./100,t,AnBTDepthcmB4./100), hold all
meanBT = (AnBTDepthcmB1+AnBTDepthcmB2+AnBTDepthcmB3+AnBTDepthcmB4)./400;
plot(t,meanBT,'k','linewidth',2)