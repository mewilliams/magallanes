% written 2 dec 2022 m williams
% run/edited 19 nov 2024


clear;
close all

disp('this file requires rdradcp.m to be in the matlab path')


addpath ~/Desktop/everything/RDADCP_Jan18v0/
addpath(genpath('~/Research/general_scripts/matlabfunctions/'))
fn = '11304_1a_MorroNunez.000';
[adcp,cfg]=rdradcp(fn,1,6923);



sensors_plot(adcp,cfg,1)
datetick2('x') % zooming datetick2.m function, can replace with datetick('x') 



figure

plot(adcp.mtime,adcp.pressure/1000)
% datetick2('x')
datetick2('x','dd mmm yyyy')


time_morronunez = adcp.mtime;
pressure_morronunez = adcp.pressure/1000;
clearvars -except time_morronunez pressure_morronunez
readme_morronunez = ['pressure data from 11304_1a_MorroNunez.000 code: read_shoa_adcp_morronunez.m on '...
    datestr(now,'dd mmm yyyy')];

ix_good = 1055:6865;
time_morronunez = time_morronunez(ix_good);
pressure_morronunez = pressure_morronunez(ix_good);
clear ix_good
save('morronunez_pressure_shoa_adcp')





return;

velocities_pcolor(adcp,cfg,10)
datetick2('x')

echo_intensity_pcolor(adcp,cfg,11)
datetick2('x')

pctgood_pcolor(adcp,cfg,12)
datetick2('x')

corr_pcolor(adcp,cfg,13)
datetick2('x')



subplot(511), pcolor(adcp.mtime,-cfg.ranges,squeeze(adcp.intens(:,1,:))), shading flat, cbax = colorbar;
ylabel(cbax,'echo intensity 1')
subplot(512), pcolor(adcp.mtime,-cfg.ranges,squeeze(adcp.intens(:,2,:))), shading flat, cbax = colorbar;
ylabel(cbax,'echo intensity 2')
subplot(513), pcolor(adcp.mtime,-cfg.ranges,squeeze(adcp.intens(:,3,:))), shading flat, cbax = colorbar;
ylabel(cbax,'echo intensity 3')
subplot(514), pcolor(adcp.mtime,-cfg.ranges,squeeze(adcp.intens(:,4,:))), shading flat, cbax = colorbar;
ylabel(cbax,'echo intensity 4')

subplot(515), pcolor(adcp.mtime,-cfg.ranges,squeeze(nanmean(adcp.corr,2))), shading flat, cbax = colorbar;
ylabel(cbax,'Avg. echo intensity')



function [] = pctgood_pcolor(adcp,cfg,figure_number)
figure(figure_number)
subplot(511), pcolor(adcp.mtime,-cfg.ranges,squeeze(adcp.perc_good(:,1,:))), shading flat, cbax = colorbar;
ylabel(cbax,'% good beam 1'), caxis([0 100])
subplot(512), pcolor(adcp.mtime,-cfg.ranges,squeeze(adcp.perc_good(:,2,:))), shading flat, cbax = colorbar;
ylabel(cbax,'% good beam 2'), caxis([0 100])
subplot(513), pcolor(adcp.mtime,-cfg.ranges,squeeze(adcp.perc_good(:,3,:))), shading flat, cbax = colorbar;
ylabel(cbax,'% good beam 3'), caxis([0 100])
subplot(514), pcolor(adcp.mtime,-cfg.ranges,squeeze(adcp.perc_good(:,4,:))), shading flat, cbax = colorbar;
ylabel(cbax,'% good beam 4'), caxis([0 100])

subplot(515), pcolor(adcp.mtime,-cfg.ranges,squeeze(nanmean(adcp.perc_good,2))), shading flat, cbax = colorbar;
ylabel(cbax,'Avg. % good'), caxis([0 100])

for i=1:5
    subplot(5,1,i)
    grid on
    ylabel('z (m)')
end

% figure(figure_n/umber)

end


function [] = velocities_pcolor(adcp,cfg,figure_number)
figure(figure_number)
subplot(411), pcolor(adcp.mtime,-cfg.ranges,adcp.east_vel), shading flat, cbax = colorbar;
ylabel(cbax,'East Vel. (m/s)'), caxis([-1 1])
subplot(412), pcolor(adcp.mtime,-cfg.ranges,adcp.north_vel), shading flat, cbax = colorbar;
ylabel(cbax,'North Vel. (m/s)'), caxis([-1 1])
subplot(413), pcolor(adcp.mtime,-cfg.ranges,adcp.vert_vel), shading flat, cbax = colorbar;
ylabel(cbax,'Vert. Vel. (m/s)'), caxis([-1 1])
subplot(414), pcolor(adcp.mtime,-cfg.ranges,adcp.error_vel), shading flat, cbax = colorbar;
ylabel(cbax,'Error Vel. (m/s)'), caxis([-1 1])

for i=1:4
    subplot(4,1,i)
    grid on
    ylabel('z (m)')
end

end

function [] = sensors_plot(adcp,cfg,figure_number)
figure(figure_number)

subplot(511), plot(adcp.mtime,adcp.pitch), ylabel('pitch (deg)')
subplot(512), plot(adcp.mtime,adcp.roll), ylabel('roll (deg)')
subplot(513), plot(adcp.mtime,adcp.heading), ylabel('heading (deg)')
subplot(514), plot(adcp.mtime,adcp.pressure), ylabel('pressure (units?)')
subplot(515), plot(adcp.mtime,adcp.temperature), ylabel('temperature (C)')
xl = xlim; datelabel1 = datestr(xl(1)); datelabel2 = datestr(xl(2));
xlabel([datelabel1,' to ',datelabel2])

for i = 1:5
    subplot(5,1,i)
    grid on
    set(gca,'tickdir','out')
end

end


function [] = echo_intensity_pcolor(adcp,cfg,figure_number)
f

% figure(figure_n/umber)

end


function [] = corr_pcolor(adcp,cfg,figure_number)
figure(figure_number)
subplot(511), pcolor(adcp.mtime,-cfg.ranges,squeeze(adcp.corr(:,1,:))), shading flat, cbax = colorbar;
ylabel(cbax,'corr 1')
subplot(512), pcolor(adcp.mtime,-cfg.ranges,squeeze(adcp.corr(:,2,:))), shading flat, cbax = colorbar;
ylabel(cbax,'corr 2')
subplot(513), pcolor(adcp.mtime,-cfg.ranges,squeeze(adcp.corr(:,3,:))), shading flat, cbax = colorbar;
ylabel(cbax,'corr 3')
subplot(514), pcolor(adcp.mtime,-cfg.ranges,squeeze(adcp.corr(:,4,:))), shading flat, cbax = colorbar;
ylabel(cbax,'corr 4')

subplot(515), pcolor(adcp.mtime,-cfg.ranges,squeeze(nanmean(adcp.corr,2))), shading flat, cbax = colorbar;
ylabel(cbax,'Avg. corr')

for i=1:5
    subplot(5,1,i)
    grid on
    ylabel('z (m)')
end

% figure(figure_n/umber)

end
