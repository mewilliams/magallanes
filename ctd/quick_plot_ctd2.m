
addpath ~/Research/general_scripts/matlabfunctions/


clear;
close all

li = 1;

C = linspecer(12);
for i =12:23%:23
    
    
    
    fn = ['cast0',num2str(i),'_C_F_A_T_L_D.cnv'];
    returnhere = pwd;
    cd ctd_angostura_magalanes/
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
    
    
    figure(101)
    plot(p), hold all
    
    nmax = find(ctd.prSM== max(ctd.prSM));
    ei = nmax; % max index, bottom of cast.
    
    
    [pk,ix] = findpeaks(-ctd.prSM(1:ei),'MinPeakHeight',-5);
    si = ix(end);
    
    if i==13
        si = 769; ei = 828;
    elseif i == 17
        si = 151; ei = 235;
    elseif i == 18
        si = 671; ei = 716;
    elseif i == 20
        si = 44; ei = 84;
    elseif i == 22
        si = 552; ei = 590;
    elseif i == 23
        si = 149; ei = 176;
    end
    
    
    
    plot(si:ei,p(si:ei),'ko'), title(num2str(i))
    %pause
    %     clf
    
    
    
    
    T = ctd.t090C(si:ei);
    %     S = ctd.sal00(si:ei);
    %     dens = ctd.density00(si:ei);
    p = ctd.prSM(si:ei);
    
    
    S = ctd.sal00(si:ei);
    dens = ctd.density00(si:ei);
    figure(90)
    
    ax(1) = subplot(131);
    plot(T,p,'color',C(li,:)), grid on, title('T [C]'), axis ij, hold all
    ax(2) = subplot(132);
    plot(S,p,'color',C(li,:)), grid on, axis ij, hold all
    title('S')
    ax(3) = subplot(133);
    plot(dens,p,'color',C(li,:)), title('\rho [kg m^{-3}]'), grid on, axis ij, hold all
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



