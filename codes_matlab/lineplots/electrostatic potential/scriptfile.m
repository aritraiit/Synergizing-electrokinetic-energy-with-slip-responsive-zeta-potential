clc;
clear;
close all;

% Define file names and corresponding Ls values
fileNames = {'psi_y_0_1a.txt', 'psi_y_0p1_1a.txt', 'psi_y_0p25_1a.txt', 'psi_y_1p3_1a.txt'};
Ls_values = [0, 0.1, 0.25, 1.3];

% Load line style and color settings
[my_co1, Lwd1, Lst1, Markers1, MFClr1, EClr1] = linepltaccesories();

% Generate legend labels with LaTeX formatting
legendCell = strcat('$\L_s^* = $', string(num2cell(Ls_values)));

figure;
hold on;

% Loop through each file, load data, and plot
for k = 1:length(fileNames)
    data = load(fileNames{k});
    x = data(:,1);
    psi = data(:,2);
    
    % Define marker indices for better spacing
    MarkerIndices = round(linspace(1, length(x), 10)); 
    
    % Plot with detailed styling
    plot(x, psi, 'LineWidth', Lwd1{k}, 'Color', my_co1{k}, ...
         'LineStyle', Lst1{k}, 'Marker', Markers1{k}, 'MarkerSize', 10, ...
         'MarkerEdgeColor', EClr1{k}, 'MarkerFaceColor', MFClr1{k}, 'MarkerIndices', MarkerIndices, ...
         'DisplayName', sprintf('$L_s^* = %.2f$', Ls_values(k)));
end

hold off;

% Formatting the plot
set(gca, 'FontSize', 24, 'LineWidth', 1.3, 'TickLabelInterpreter', 'latex');
xlabel('\textbf{$y^*$}', 'Interpreter', 'latex', 'FontSize', 24);
ylabel('\textbf{$\psi^*$}', 'Interpreter', 'latex', 'FontSize', 24);

% Customizing the legend
l1 = legend('Location', 'northeast', 'FontSize', 24, 'Interpreter', 'latex');
legend boxoff;
%ylim([0,16]);
% Adjust figure size
set(gcf, 'Position', [100 50 750 650]);
box on;
