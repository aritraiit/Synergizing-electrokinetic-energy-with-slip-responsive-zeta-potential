function [my_co1,Lwd1,Lst1,Markers1,MFClr1,EClr1] = linepltaccesories()
            
            % for slip dependent flow profile
            my_co1={[0     0.4470    0.7410],...
                   [1 0 0],...
                   [0.9290    0.6940    0.1250],...
                   [0.8500 0.3250 0.0980],...
                   [0.4940 0.1840 0.5560]};
            
            Lwd1={3,3,3,3,3};
            Lst1={'-','-','-.','--','-.'};
            Markers1 = {'s','d','<','>','^'};
            MFClr1={my_co1{1},'none',my_co1{3},my_co1{4},my_co1{5}};
            EClr1=my_co1;

            
end

