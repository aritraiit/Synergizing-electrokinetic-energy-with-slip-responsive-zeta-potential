function [my_co1,Lwd1,Lst1,Markers1,MFClr1,EClr1] = linepltaccesories()
            
            % for slip dependent flow profile
my_co1 = { [ 31, 120, 180] / 255, ... 
           [0.8510, 0.3725, 0.0078], ...
           [0.4588, 0.4392, 0.7019], ...  % Purple
           [0.9059, 0.1608, 0.5412], ...  % Magenta
           [0.4000, 0.6510, 0.1176] };     % Olive Green

            
            Lwd1={3,3,3,3,3};
            Lst1={'-','-','-.','--','-.'};
            Markers1 = {'s','d','<','>','^'};
            MFClr1={my_co1{1},'none',my_co1{3},my_co1{4},my_co1{5}};
            EClr1=my_co1;

            
end

