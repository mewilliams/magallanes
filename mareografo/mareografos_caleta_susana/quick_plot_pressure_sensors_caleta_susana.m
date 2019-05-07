clear 
close all;

fn_o = '200620_20190306_1241.rsk';

[ts_o,p_o] = timestring_RBR_and_pres(fn_o);


fn_i = '200619_20190306_1245.rsk';

[ts_i,p_i] = timestring_RBR_and_pres(fn_i);

save('pressure_sensors_raw','ts_i','ts_o','p_i','p_o')





function [ts,p] = timestring_RBR_and_pres(fn)

rsk = RSKopen(fn);
rsk = RSKreaddata(rsk);
rbr = RSK2MAT(rsk);


ts = NaN(length(rbr.sampletimes),1);
p = rbr.data;

for i = 1:length(rbr.sampletimes)
day = str2num(rbr.sampletimes{i}(9:10));
month = str2num(rbr.sampletimes{i}(6:7));
year = str2num(rbr.sampletimes{i}(1:4));
seconds = str2num(rbr.sampletimes{i}(end-5:end));
minutes = str2num(rbr.sampletimes{i}(end-8:end-7));
hours = str2num(rbr.sampletimes{i}(end-11:end-10));

ts(i) = datenum(year,month,day,hours,minutes,seconds);

end

end