addpath('/Users/mew/Research/general_scripts/IOC_QQ_NOC'); % this has the scripts

clear all;
close all;


% 
% [sensornames]=readIOC('ptar',datenum(2011,8,1),datenum(2022,8,1),'../raw_data/ptar/','auto');
% 
% [sensornames]=readIOC('cmet',datenum(2011,11,1),datenum(2022,8,1),'../raw_data/cmet/','auto');

% [sensornames]=readIOC('greg',datenum(2014,7,1),datenum(2022,8,1),'../raw_data/greg/','auto');

% 
% % for yr = 2011:2021
% 
% for yr = 2021:2021
% [sensornames]=readIOC('ptar',datenum(yr,1,1),datenum(yr+1,1,2),'../raw_data/ptar/','auto');
% disp(['done with ',num2str(yr),' for Punta Arenas'])
% 
% 
% end
% % 2022:
% [sensornames]=readIOC('ptar',datenum(2022,1,1),datenum(2022,9,1),'../raw_data/ptar/','auto');

% [sensornames]=readIOC('greg',datenum(2022,1,1),datenum(2022,9,1),'../raw_data/greg/','auto');

% for yr = 2014:2021

% for yr = 2018:2021
%     tic
% [sensornames]=readIOC('greg',datenum(yr,1,1),datenum(yr+1,1,2),'../raw_data/greg/','auto');
% disp(['done with ',num2str(yr),' for San Gregorio'])
% toc
% end
% % 2022:
% [sensornames]=readIOC('greg',datenum(2022,1,1),datenum(2022,9,1),'../raw_data/greg/','auto');




% for yr = 2011:2021

for yr = 2011:2021
[sensornames]=readIOC('cmet',datenum(yr,1,1),datenum(yr+1,1,2),'../raw_data/cmet/','auto');
disp(['done with ',num2str(yr),' for Caleta Meteoro'])
end
% 2022:
[sensornames]=readIOC('cmet',datenum(2022,1,1),datenum(2022,9,1),'../raw_data/cmet/','auto');