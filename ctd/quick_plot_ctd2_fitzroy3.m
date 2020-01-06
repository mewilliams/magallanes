presentation_figure_startup
addpath ~/Research/general_scripts/matlabfunctions/
add_gsw


clear;
close all

li = 1;


returnhere = pwd;

cd cnv_data/
files_11may = dir('11-May-2019*cnv');
files_9may = dir('09-May-2019*cnv');
cd(returnhere)
C = linspecer(8);

for i = length(files_11may)-5:length(files_11may)
    
    
    returnhere = pwd;
    cd cnv_data/
    
    
    ctd = ctd_rd(files_11may(i).name);
    cd(returnhere)
    
    % placeholders
    si = 1;
    ei = length(ctd.t090C);
    
    
    T = ctd.t090C(si:ei);
    %     S = ctd.sal00(si:ei);
    %     dens = ctd.density00(si:ei);
    p = ctd.prSM(si:ei);
    cond = ctd.c0uS(si:ei);
    
    
    %     S = ctd.sal00(si:ei);
    %     dens = ctd.density0 0(si:ei);
    
    figure(99)
    
    ax(1) = subplot(131);
    plot(ctd.t090C,ctd.prSM), grid on, title('T [C]'), axis ij, hold all
    ax(2) = subplot(132);
    plot(ctd.c0uS,ctd.prSM), grid on, axis ij, hold all
    title('cond')
    
    
    %     ax(3) = subplot(133);
    %     plot(ctd.density00,ctd.prSM), title('\rho [kg m^{-3}]'), grid on, axis ij, hold all
    linkaxes(ax,'y')
    
    
    figure(101)
    plot(p), hold all
    
    nmax = find(ctd.prSM== max(ctd.prSM));
    ei = nmax; % max index, bottom of cast.
    
    
    [pk,ix] = findpeaks(-ctd.prSM(1:ei),'MinPeakHeight',-5);
    si = ix(end);
    %
       if i==11
             si = 14;
       elseif i ==12
           si = 16;
       elseif i == 13
           si = 19;
       elseif i == 19
           si = 150;
       elseif i == 20;
           si = 13;
       end
       
       
       
    %     elseif i == 17
    %         si = 151; ei = 235;
    %     elseif i == 18
    %         si = 671; ei = 716;
    %     elseif i == 20
    %         si = 44; ei = 84;
    %     elseif i == 22
    %         si = 552; ei = 590;
    %     elseif i == 23
    %         si = 149; ei = 176;
    %     end
    %
    
    
    plot(si:ei,p(si:ei),'ko'), title(num2str(i))
%     pause
%     clf
    
    
    
    
    T = ctd.t090C(si:ei);
    %     S = ctd.sal00(si:ei);
    %     dens = ctd.density00(si:ei);
    p = ctd.prSM(si:ei);
    
    
    %     S = ctd.sal00(si:ei);
    cond = ctd.c0uS(si:ei);
    
    SP = gsw_SP_from_C(cond/1000,T,p);
    
    
    %     dens = ctd.density00(si:ei);
    figure(90)
    
    ax(1) = subplot(131);
    plot(T,p,'color',C(li,:)), grid on, title('T [C]'), axis ij, hold all
    ax(2) = subplot(132);
    plot(SP,p,'color',C(li,:)), grid on, axis ij, hold all
    title('salt')
    %     ax(3) = subplot(133);
    %     plot(dens,p,'color',C(li,:)), title('\rho [kg m^{-3}]'), grid on, axis ij, hold all
    linkaxes(ax,'y')
    
    %     t(li) = ctd.start_mtime;
    %     p_intp = -2.5:.1:1;
    %     if li == 1
    %         s_intp = NaN(size(p_intp));
    %
    %         t_intp = NaN(size(p_intp));
    %
    %     end
    %             s_intp(li,:) = interp1(p(2:end),S(2:end),p_intp);
    %             t_intp(li,:) = interp1(p(2:end),T(2:end),p_intp);
    
    legentry{li} = datestr(ctd.start_mtime);
    legend(legentry)
    li = li+1;
    
    
    
end

%%

C = linspecer(length(files_9may));
li = 1;
for i = 1:length(files_9may)
    
    
    returnhere = pwd;
    cd cnv_data/
    
    
    ctd = ctd_rd(files_9may(i).name);
    cd(returnhere)
    
    % placeholders
    si = 1;
    ei = length(ctd.t090C);
    
    
    T = ctd.t090C(si:ei);
    %     S = ctd.sal00(si:ei);
    %     dens = ctd.density00(si:ei);
    p = ctd.prSM(si:ei);
    cond = ctd.c0uS(si:ei);
    
    
    %     S = ctd.sal00(si:ei);
    %     dens = ctd.density0 0(si:ei);
    
    figure(990)
    
    ax(1) = subplot(131);
    plot(ctd.t090C,ctd.prSM), grid on, title('T [C]'), axis ij, hold all
    ax(2) = subplot(132);
    plot(ctd.c0uS,ctd.prSM), grid on, axis ij, hold all
    title('cond')
    
    
    %     ax(3) = subplot(133);
    %     plot(ctd.density00,ctd.prSM), title('\rho [kg m^{-3}]'), grid on, axis ij, hold all
    linkaxes(ax,'y')
    
    
    
    
    figure(201)
    plot(p), hold all
    
    nmax = find(ctd.prSM== max(ctd.prSM));
    ei = nmax; % max index, bottom of cast.
    
    
    [pk,ix] = findpeaks(-ctd.prSM(1:ei),'MinPeakHeight',-5);
    si = ix(end);
    %
       if i==13
           si = 260;
       end
%              si = 14;
%        elseif i ==12
%            si = 16;
%        elseif i == 13
%            si = 19;
%        elseif i == 19
%            si = 150;
%        elseif i == 20;
%            si = 13;
%        end
%        
       
       
    %     elseif i == 17
    %         si = 151; ei = 235;
    %     elseif i == 18
    %         si = 671; ei = 716;
    %     elseif i == 20
    %         si = 44; ei = 84;
    %     elseif i == 22
    %         si = 552; ei = 590;
    %     elseif i == 23
    %         si = 149; ei = 176;
    %     end
    %
    
    
    plot(si:ei,p(si:ei),'ko'), title(num2str(i))
%      pause
%      clf
    
    
    
    
    T = ctd.t090C(si:ei);
    %     S = ctd.sal00(si:ei);
    %     dens = ctd.density00(si:ei);
    p = ctd.prSM(si:ei);
    
    
    %     S = ctd.sal00(si:ei);
    cond = ctd.c0uS(si:ei);
    
    SP = gsw_SP_from_C(cond/1000,T,p);
     figure(9000)
    
    ax(1) = subplot(131);
    plot(T,p,'color',C(li,:)), grid on, title('T [C]'), axis ij, hold all
    ax(2) = subplot(132);
    plot(SP,p,'color',C(li,:)), grid on, axis ij, hold all
    title('salt')
    %     ax(3) = subplot(133);
    %     plot(dens,p,'color',C(li,:)), title('\rho [kg m^{-3}]'), grid on, axis ij, hold all
    linkaxes(ax,'y')
    
    %     t(li) = ctd.start_mtime;
    %     p_intp = -2.5:.1:1;
    %     if li == 1
    %         s_intp = NaN(size(p_intp));
    %
    %         t_intp = NaN(size(p_intp));
    %
    %     end
    %             s_intp(li,:) = interp1(p(2:end),S(2:end),p_intp);
    %             t_intp(li,:) = interp1(p(2:end),T(2:end),p_intp);
    
    legentry{li} = datestr(ctd.start_mtime);
    legend(legentry)
    li = li+1;
end


