% 29 August 2017
% M williams
% changed froma  bluecoast sript on 28 feb 2019
%
% 

clear
close all

return_here = pwd;

% file_dir = '/projectsa/BLUEcoast/Essex/data/frameB/signature'
file_dir = return_here;
cd(file_dir)


filenames = dir('S100465A003_BW_B_May_03*');

fn = dir('*.mat')
fn = fn(1:3);
filenames = fn;

cd(return_here)

disp(length(filenames))
disp(filenames(1).name)

%% Oh, that doesn't do a very nice order.  I'll do it manually

cd(file_dir)


% for fi = 1:length(filenames) % error at 268??
    
% for fi = 1:length(filenames)
  for   fi  = 2
    fn = filenames(fi).name;
%     fn = ['S100465A003_BW_B_May_03_' num2str(fi) '.mat'];
    
    load(fn)
    
    figure(9)
    plot(Data.Burst_Time,Data.Burst_Pressure), hold all
    
    
    figure(99)
    plot(Data.Burst_Time,Data.Burst_Velocity_ENU(:,1,2)), hold all
    
    disp(fi)
end

%%
svel = size(Data.Burst_Velocity_ENU);


idx = 1;
eastvel_fakeburst = NaN(idx,svel(3));
northvel_fakeburst = eastvel_fakeburst;
vertvel_fakeburst = eastvel_fakeburst;
time_fakeburst = NaN(1,svel(3));
for fi = 1:length(filenames)
        fn = filenames(fi).name;

%     fn{fi} = ['S100465A003_BW_B_May_03_' num2str(fi) '.mat'];
    load(fn)
    
    if ~isempty(find(diff(Data.Burst_Time)>3E-3, 1))
        burst_idx = find(diff(Data.Burst_Time)>3E-3);
        no_bursts = length(burst_idx)+1;
        
        if no_bursts == 2
            clear b
            b{1} = 1:burst_idx;
            b{2} = burst_idx+1:length(Data.Burst_Time);
        elseif no_bursts == 3
            clear b
            
            b{1} = 1:burst_idx(1);
            b{2} = burst_idx(1)+1:burst_idx(2);
            b{3} = burst_idx(2)+1:length(Data.Burst_Time);
        end
    else
        clear b
        b{1} = 1:length(Data.Burst_Time);
    end
    
    
    
    %burst average something?
    for bi = 1:length(b)
        eastvel_fakeburst(idx,:) = mean(Data.Burst_Velocity_ENU(b{bi},1,:));
        northvel_fakeburst(idx,:) = mean(Data.Burst_Velocity_ENU(b{bi},2,:));
        time_fakeburst(idx) = mean(Data.Burst_Time(b{bi}));
        vertvel_fakeburst(idx,:) = mean(Data.Burst_Velocity_ENU(b{bi},3,:));
        idx = idx+1
    end
    
    
    
end



cd(return_here)
