addpath ~/Research/general_scripts/matlabfunctions/
addpath(genpath('~/Research/general_scripts/matlabfunctions/t_tide/'))
addpath ~/Research/general_scripts/IOC_QQ_NOC/


clear
close all;

fn = '../raw_data/ptar/ptar_rad_20190101_20200102.txt';
% fn = '../raw_data/greg/greg_prs_20140101_20150102.txt';

% fid=fopen([datadir,sensorbasefile '.txt'],'r');
fid=fopen(fn,'r');


C = textscan(fid,'%f %4f-%2f-%2f %2f:%2f:%2f %s','headerlines',0,'whitespace',' \n\r\t');

fclose(fid);

slevel=C{1};
sdate=datenum(C{2},C{3},C{4},C{5},C{6},C{7});

%subsample:

sdatehour = datenum(year(min(sdate)),1,1,0,0,0):1/24:datenum(year(max(sdate)),1,1,0,0,0);
slevelhour = interp1(sdate,slevel,sdatehour);


% [NAME,FREQ,TIDECON,XOUT]=t_tide(slevel,'interval',1/60); 
[NAME,FREQ,TIDECON,XOUT]=t_tide(slevelhour,'interval',1); 


figure
subplot(2,1,1)
plot(sdatehour,slevelhour)
subplot(2,1,2)
plot(sdatehour,XOUT)
datetick2('x')     )