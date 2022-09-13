% 12 sept 2022
%
% 
addpath ~/Research/general_scripts/matlabfunctions/
tic




clear;
close all;

stn = 'greg';
disp(['starting with station, ',stn]) 

[time_utc,pres_m,rad_m] = get_ioc_tides_internet(stn,2022,2022);
fnsave = ['../raw_data/station_',stn,'_2022_2022_test'];
readme = ['file created on ',datestr(now),' with script get_and_save_ioc_tides_magellan_region.m'];
save(fnsave,time_utc,pres_m,rad_m,readme)
disp(['ending with station, ',stn]) 
toc

return;

clear;
close all;

stn = 'greg';
disp(['starting with station, ',stn]) 

[time_utc,pres_m,rad_m] = get_ioc_tides_internet(stn,2020,2022);
fnsave = ['../raw_data/station_',stn,'_2020_2022'];
readme = ['file created on ',datestr(now),' with script get_and_save_ioc_tides_magellan_region.m'];
save(fnsave,time_utc,pres_m,rad_m,readme)
disp(['ending with station, ',stn]) 


clear;
stn = 'ptar';
disp(['starting with station, ',stn]) 

[time_utc,pres_m,rad_m] = get_ioc_tides_internet(stn,2020,2022);
fnsave = ['../raw_data/station_',stn,'_2020_2022'];
readme = ['file created on ',datestr(now),' with script get_and_save_ioc_tides_magellan_region.m'];
save(fnsave,time_utc,pres_m,rad_m,readme)
disp(['ending with station, ',stn]) 

clear;
stn = 'cmet';
disp(['starting with station, ',stn]) 

[time_utc,pres_m,rad_m] = get_ioc_tides_internet(stn,2020,2022);
fnsave = ['../raw_data/station_',stn,'_2020_2022'];
readme = ['file created on ',datestr(now),' with script get_and_save_ioc_tides_magellan_region.m'];
save(fnsave,time_utc,pres_m,rad_m,readme)


toc


clear;

stn = 'ptar';
disp(['starting with station, ',stn]) 
disp('2012 - 2020' ) 

[time_utc,pres_m,rad_m] = get_ioc_tides_internet(stn,2012,2020);
fnsave = ['../raw_data/station_',stn,'_2012_2022'];
readme = ['file created on ',datestr(now),' with script get_and_save_ioc_tides_magellan_region.m'];
save(fnsave,time_utc,pres_m,rad_m,readme)
disp(['ending with station, ',stn]) 
