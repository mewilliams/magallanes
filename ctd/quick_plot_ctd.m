

clear;
close all

for i =4%1:10
    
    %   for  i = 5
    
    if i<=11
        ctd = load_ctd_cast(i);
        
    else
        ctd = load_ctd_cast_cond_only(i);
    end
    
    
    
    
    
    nmax = find(ctd.prSM== max(ctd.prSM));
    ei = nmax; % max index, bottom of cast.
    
    
    [pk,ix] = findpeaks(-ctd.prSM(1:ei),'MinPeakHeight',-10);
    si = ix(end);
    
    if i == 10
        si = 75;
        ei = 131;
    elseif i == 4
        si = 581; ei = 687;
    elseif i == 5
        si = 34; ei = 1134;
    elseif i == 6
        si = 30; ei = 195;
    elseif i == 7
        si = 1; ei = 88;
    elseif i == 8
        si = 102; ei = 163;
        
    elseif i == 9
        si = 67; ei = 103;
    else disp('relying on findpeaks for indices')
    end
    
    
    
    
    T = ctd.t090C(si:ei);
    %     S = ctd.sal00(si:ei);
    %     dens = ctd.density00(si:ei);
    p = ctd.prSM(si:ei);
    
    
    S = ctd.sal00(si:ei);
    dens = ctd.density00(si:ei);
    
    figure(99)
    
    ax(1) = subplot(131);
    plot(ctd.t090C,ctd.prSM), grid on, title('T [C]'), axis ij
    ax(2) = subplot(132);
    plot(ctd.sal00,ctd.prSM), grid on, axis ij
    title('S')
    ax(3) = subplot(133);
    plot(ctd.density00,ctd.prSM), title('\rho [kg m^{-3}]'), grid on, axis ij
    linkaxes(ax,'y')
    figure(100)
    plot(ctd.prSM), title(num2str(i))
    
%     pause;
    
    if i<=10
        
        
        figure(1)
        
        ax(1) = subplot(131);
        plot(T,p), hold all, grid on, title('T [C]'), axis ij
        ax(2) = subplot(132);
        plot(S,p), hold all, grid on, axis ij
        title('S')
        ax(3) = subplot(133);
        plot(dens,p), title('\rho [kg m^{-3}]'), hold all, grid on, axis ij
    else
        
        cond = ctd.c0uS(si:ei);
        
        sp = gsw_SP_from_C(ctd.c0uS/1000,ctd.t090C,ctd.prSM);
        [sa,inoc] = gsw_SA_from_SP(sp,1,-70.323,-52.647);
        
        
        %         hold all
        % plot(sa)
        rho = gsw_rho(sa,ctd.t090C,ctd.prSM);
        figure(6),
        
        
        ax(1) = subplot(131);
        plot(ctd.t090C,ctd.prSM), hold all, grid on, title('T [C]'), axis ij
        ax(2) = subplot(132);
        plot(sp,ctd.prSM), hold all, grid on, axis ij
        title('S')
        ax(3) = subplot(133);
        plot(rho,ctd.prSM), hold all, grid on, axis ij
        title('density')
        
        
        figure(2)
        
        
        ax(1) = subplot(131);
        plot(T,p), hold all, grid on, title('T [C]'), axis ij
        ax(2) = subplot(132);
        plot(cond,p), hold all, grid on, axis ij
        title('cond [uS]')
        %         ax(3) = subplot(133);
        %         plot(dens,p), title('\rho [kg m^{-3}]'), hold all, grid on, axis ij
        
        
        
        figure(3)
        
        
        ax(1) = subplot(131);
        plot(ctd.t090C,ctd.prSM), hold all, grid on, title('T [C]'), axis ij
        ax(2) = subplot(132);
        plot(ctd.c0uS,ctd.prSM), hold all, grid on, axis ij
        title('cond [uS]')
        ax(3) = subplot(133);
        plot(ctd.oxML,ctd.prSM), hold all, grid on, axis ij
        title('o_2 [ml]')
        
        
        %         figure(4), plot(ctd.prSM), hold all
        %         legentry{i-3} = [num2str(i)];
        %         legend(legentry)
    end
end

function ctd = load_ctd_cast(cast_no)

fn = ['cast_',num2str(cast_no),'_C_F_A_T_L_D.cnv'];

returnhere = pwd;
cd ctd_angostura_magalanes/
ctd = ctd_rd(fn);
cd(returnhere)


end


function ctd = load_ctd_cast_cond_only(cast_no)

fn = ['cast_',num2str(cast_no),'_C.cnv'];

returnhere = pwd;
cd ctd_angostura_magalanes/
ctd = ctd_rd(fn);
cd(returnhere)


end