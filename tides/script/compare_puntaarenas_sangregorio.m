clear
close all;


clear
close all;

fn = '../raw_data/ptar/ptar_rad_20190101_20200102.txt';
% fn = '../raw_data/greg/greg_prs_20140101_20150102.txt';

% fid=fopen([datadir,sensorbasefile '.txt'],'r');
fid=fopen(fn,'r');


C = textscan(fid,'%f %4f-%2f-%2f %2f:%2f:%2f %s','headerlines',0,'whitespace',' \n\r\t');

fclose(fid);

slevel_ptar=C{1};
sdate_ptar=datenum(C{2},C{3},C{4},C{5},C{6},C{7});


fn = '../raw_data/greg/greg_rad_20190101_20200102.txt';
% fn = '../raw_data/greg/greg_prs_20140101_20150102.txt';

% fid=fopen([datadir,sensorbasefile '.txt'],'r');
fid=fopen(fn,'r');


C = textscan(fid,'%f %4f-%2f-%2f %2f:%2f:%2f %s','headerlines',0,'whitespace',' \n\r\t');

fclose(fid);

slevel_greg=C{1};
sdate_greg=datenum(C{2},C{3},C{4},C{5},C{6},C{7});


figure
subplot(2,1,1)
plot(sdate_greg,slevel_greg-median(slevel_greg),sdate_ptar-median(sdate_ptar),slevel_ptar)
subplot(2,1,2)
plot(sdate_greg,slevel_greg-interp1(sdate_ptar,slevel_ptar,sdate_greg))




figure
subplot(2,1,1)
plot(sdate_greg,slevel_greg-nanmedian(slevel_greg),sdate_ptar,slevel_ptar-nanmedian(slevel_ptar))
subplot(2,1,2)
plot(sdate_greg,slevel_greg-nanmedian(slevel_greg) - interp1(sdate_ptar,slevel_ptar-nanmedian(slevel_ptar),sdate_greg))
datetick2('x')

%%

% tide - t_tide analysis:

sdatehour = datenum(year(min(sdate_ptar)),1,1,0,0,0):1/24:datenum(year(max(sdate_ptar)),1,1,0,0,0);
slevelhour = interp1(sdate_ptar,slevel_ptar,sdatehour);
slevelhour_greg =  interp1(sdate_greg,slevel_greg,sdatehour);


% [NAME,FREQ,TIDECON,XOUT]=t_tide(slevel,'interval',1/60); 
[NAME,FREQ,TIDECON,XOUT]=t_tide(slevelhour,'interval',1); 
XOUT_ptar = XOUT;


% [NAME,FREQ,TIDECON,XOUT]=t_tide(slevel,'interval',1/60); 
[NAME,FREQ,TIDECON,XOUT]=t_tide(slevelhour_greg,'interval',1); 
XOUT_greg= XOUT;



%%
fn = '../raw_data/cmet/cmet_rad_20190101_20200102.txt';
% fn = '../raw_data/greg/greg_prs_20140101_20150102.txt';

% fid=fopen([datadir,sensorbasefile '.txt'],'r');
fid=fopen(fn,'r');


C = textscan(fid,'%f %4f-%2f-%2f %2f:%2f:%2f %s','headerlines',0,'whitespace',' \n\r\t');

fclose(fid);

slevel_cmet=C{1};
sdate_cmet=datenum(C{2},C{3},C{4},C{5},C{6},C{7});


figure, plot(sdate_cmet,slevel_cmet)

slevelhour_cmet =  interp1(sdate_cmet,slevel_cmet,sdatehour);
% [NAME,FREQ,TIDECON,XOUT]=t_tide(slevel,'interval',1/60); 
[NAME,FREQ,TIDECON,XOUT]=t_tide(slevelhour_cmet,'interval',1); 
XOUT_cmet= XOUT;


