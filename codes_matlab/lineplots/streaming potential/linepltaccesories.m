function [my_co1,Lwd1,Lst1,Markers1,MFClr1,EClr1] = linepltaccesories()
            
            % for slip dependent flow profile
my_co1 = { [ 155,  52, 182 ]/255, ...   
           [0.9290 0.6940 0.1250], ...    % Vivid orange
           [0 0 1], ...  % Muted purple
           [231, 41, 138] / 255, ...   % Vibrant magenta
           [102, 166, 30] / 255 };     % Bright lime green

            
            Lwd1={3,3,3,3,3};
            Lst1={'-','-','-.','--','-.'};
            Markers1 = {'s','d','<','>','^'};
            MFClr1={my_co1{1},'none',my_co1{3},my_co1{4},my_co1{5}};
            EClr1=my_co1;

            
end

