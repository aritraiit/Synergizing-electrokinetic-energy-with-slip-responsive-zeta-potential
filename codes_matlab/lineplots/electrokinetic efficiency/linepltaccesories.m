function [my_co1,Lwd1,Lst1,Markers1,MFClr1,EClr1] = linepltaccesories()
            
            % for slip dependent flow profile
my_co1 = { [155, 52, 182] / 255, ...        % Purple
           [0.9290, 0.6940, 0.1250], ...      % Vivid orange
           [0, 0, 1], ...                    % Blue
           [255, 85, 0] / 255,...
           [102, 166, 30] / 255, ...          % Green
           [139, 0, 0] / 255 };               % Dark red (replacement for magenta)


            
            Lwd1={3,3,3,3,3,3};
            Lst1={'-','-','-.','--','-.','--'};
            Markers1 = {'s','d','<','>','^','>'};
            MFClr1={my_co1{1},'none',my_co1{3},my_co1{4},my_co1{5},my_co1{2}};
            EClr1=my_co1;

            
end

