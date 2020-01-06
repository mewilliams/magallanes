
addpath ~/Research/general_scripts/matlabfunctions/
addpath ~/Research/general_scripts/matlabfunctions/cbrewer/

presentation_figure_startup

clear;
close all

li = 1;


castno = [0:22,25:26];
castno = [13:22,26];
C = linspecer(length(castno));

C = cbrewer('qual','Set2',length(castno));
ai = 1;
% castno = 22;
for i =castno  %0:26%:23
    
    
    if i<10
    fn = ['CAST00',num2str(i),'_C_D.cnv'];
    elseif i>=10
            fn = ['CAST0',num2str(i),'_C_D.cnv'];
    end
    

    returnhere = pwd;
    cd CAST_fitroy/
    ctd = ctd_rd(fn);
    cd(returnhere)
    
    % placeholders
    si = 1;
    ei = length(ctd.t090C);
    
    
    T = ctd.t090C(si:ei);
    %     S = ctd.sal00(si:ei);
    %     dens = ctd.density00(si:ei);
    p = ctd.prSM(si:ei);
    
    
    S = ctd.sal00(si:ei);
    dens = ctd.density00(si:ei);
    
    figure(99)
    
    ax(1) = subplot(131);
    plot(ctd.t090C,ctd.prSM), grid on, title('T [C]'), axis ij, hold all
    ax(2) = subplot(132);
    plot(ctd.sal00,ctd.prSM), grid on, axis ij, hold all
    title('S')
    ax(3) = subplot(133);
    plot(ctd.density00,ctd.prSM), title('\rho [kg m^{-3}]'), grid on, axis ij, hold all
    linkaxes(ax,'y')
    
    
    figure(100), clf
    plot(ctd.density00,ctd.prSM), title('\rho [kg m^{-3}]'), grid on, axis ij, hold all
title(['cast number ',num2str(i),' ', datestr(ctd.start_mtime)])
% pause

    %    
%     
    figure(101)
    plot(p), hold all
%     
    nmax = find(ctd.prSM== max(ctd.prSM));
    ei = nmax; % max index, bottom of cast.
%     
%     
    [pk,ix] = findpeaks(-ctd.prSM(1:ei),'MinPeakHeight',-5);
    si = ix(end);
    if i==22
        si = 103;
    elseif i == 14
        si = 193;
    elseif i ==15
        si = 295;
    elseif i == 17
        si = 242
    elseif i == 19
        si = 126;
    end
%     
%     if i==13
%         si = 769; ei = 828;
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
%     
%     
    plot(si:ei,p(si:ei),'ko'), title(num2str(i))
%     pause
    clf
    %pause
%     %     clf
%     
%     
%     
%     
    T = ctd.t090C(si:ei);
        S = ctd.sal00(si:ei);
        dens = ctd.density00(si:ei);
    p = ctd.prSM(si:ei);
%     
%     
%     S = ctd.sal00(si:ei);
%     dens = ctd.density00(si:ei);
    figure(90)
%     
    ax(1) = subplot(131);
    plot(T,p,'color',C(li,:)), grid on, title('T [C]'), axis ij, hold all
    ax(2) = subplot(132);
    plot(S,p,'color',C(li,:)), grid on, axis ij, hold all
    title('S')
    ax(3) = subplot(133);
    plot(dens,p,'color',C(li,:)), title('\rho [kg m^{-3}]'), grid on, axis ij, hold all
    linkaxes(ax,'y')
    li = li+1;
    
%     
%     figure(92)
%     ax(1) = subplot(121), plot(S,p), axis ij, ylabel('depth [dbar]')
%     xlabel('salinity'), grid on, title(datestr(ctd.start_mtime,'HH:MM dd mmm'))
%     ax(2) = subplot(122), plot(ctd.sal00,ctd.prSM), axis ij, ylabel('depth [dbar]')
%     xlabel('salinity'), grid on, title(num2str(i))
%    
%     linkaxes(ax,'xy')
% %     xlim([17 30])
%     pause
    
%     
% %     t(li) = ctd.start_mtime;
% %     p_intp = -2.5:.1:1;
% %     if li == 1
% %         s_intp = NaN(size(p_intp));
% %         
% %         t_intp = NaN(size(p_intp));
% %         
% %     end 
% %             s_intp(li,:) = interp1(p(2:end),S(2:end),p_intp);
% %             t_intp(li,:) = interp1(p(2:end),T(2:end),p_intp);
% 
%     legentry{li} = datestr(ctd.start_mtime);
%     legend(legentry)
%     li = li+1;
%     
%     


figure(3)
ax(ai) =  subplot(3,4,ai);
plot(S,p,'color',C(li-1,:)), title([num2str(i),' | ',datestr(ctd.start_mtime+3/24,'HH:MM')]), grid on, axis ij
linkaxes(ax,'xy')
ylabel('p'), xlabel('S')
axis auto
% ai = ai+1;

ylim([-2.5 18])
xlim([17 30])
    


figure(4)
axrho(ai) =  subplot(3,4,ai);
plot(dens,p,'color',C(li-1,:)), title([num2str(i),' | ',datestr(ctd.start_mtime+3/24,'HH:MM')]), grid on, axis ij
linkaxes(axrho,'xy')
ylabel('p'), xlabel('\rho [kg m^{-3}]]')
axis auto
ai = ai+1;

% ylim([-2.5 18])
% xlim([17 30])
end



