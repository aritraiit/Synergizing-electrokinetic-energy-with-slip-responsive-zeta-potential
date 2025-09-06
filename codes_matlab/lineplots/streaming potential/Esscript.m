clc; clear; close all;

files = { 'Es_K10_Wi1p5_n1p2.txt', ...
          'Es_K10_Wi1p5_n1.txt', ...
          'Es_K10_Wi1p5_n0p8.txt', ...
          'Es_K10_Wi1p5_n0p5.txt' };
n_val = [1.2, 1, 0.8, 0.5];  % Order corresponding to the files
nFiles = numel(files);
Ls_val = logspace(log10(1e-5), log10(1.3), 50);

% Line plot accessories (assuming this function returns cell arrays of plotting parameters)
[my_co1, Lwd1, Lst1, Markers1, MFClr1, EClr1] = linepltaccesories();
MarkerIndices = round(linspace(1, length(Ls_val), 10)); 
dataCell = cell(1, nFiles);

figure;
hold on;
for k = 1:nFiles
    % Read and convert data to double format
    dataCell{k} = readmatrix(files{k});
    mat = double(dataCell{k});
    
    % Extract Es data: second row excluding first column
    Esdat = mat(2, 2:end);
    
    % Plot using semilogx so that the x-axis is logarithmic
    plot(Ls_val, Esdat, 'LineWidth', Lwd1{k}, 'Color', my_co1{k}, ...
         'LineStyle', Lst1{k}, 'Marker', Markers1{k}, 'MarkerSize', 10, ...
         'MarkerEdgeColor', EClr1{k}, 'MarkerFaceColor', MFClr1{k}, ...
         'MarkerIndices', MarkerIndices, 'DisplayName', sprintf('$n = %.2f$', n_val(k)));
end
set(gca, "XScale", "log");
hold off;

% Formatting the plot
set(gca, 'FontSize', 24, 'LineWidth', 1.3, 'TickLabelInterpreter', 'latex');
xlabel('\textbf{$L_s^*$}', 'Interpreter', 'latex', 'FontSize', 24);
ylabel('\textbf{$E_s^*$}', 'Interpreter', 'latex', 'FontSize', 24);

% Customize the legend
legend('Location', 'northeast', 'FontSize', 24, 'Interpreter', 'latex');
legend boxoff;

% Adjust figure size
set(gcf, 'Position', [100 50 750 650]);
box on;
