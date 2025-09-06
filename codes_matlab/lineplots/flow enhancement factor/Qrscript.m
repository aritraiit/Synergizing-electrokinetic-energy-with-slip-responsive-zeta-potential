clc; clear; close all;

files = { 'Qr_zeta0.25_K10_n1p5.txt',...
          'Qr_zeta0.25_K10_n1p2.txt', ...
          'Qr_zeta0.25_K10_n1.txt', ...
          'Qr_zeta0.25_K10_n0p5.txt', ...
          'Qr_zeta0.25_K10_n0p2.txt'};

nFiles = numel(files);

n_val = [1.5,1.2, 1, 0.5,0.2];  % Order corresponding to the files

Ls_val = logspace(log10(1e-3), log10(10), 10);
Ls_value = logspace(log10(1e-3), log10(10), 100);
% Line plot accessories (assuming this function returns cell arrays of plotting parameters)
[my_co1, Lwd1, Lst1, Markers1, MFClr1, EClr1] = linepltaccesories();
MarkerIndices = round(linspace(1, length(Ls_value), 10)); 
dataCell = cell(1, nFiles);

figure;
hold on;
for k = 1:nFiles
    % Read and convert data to double format
    dataCell{k} = readmatrix(files{k});
    mat = double(dataCell{k});
    
    % Extract Es data: second row excluding first column
    Esdat = mat(2, 2:end);
    Es_interp = interp1(Ls_val, Esdat, Ls_value, 'pchip');

    % Plot using semilogx so that the x-axis is logarithmic
    plot(Ls_value, Es_interp, 'LineWidth', Lwd1{k}, 'Color', my_co1{k}, ...
         'LineStyle', Lst1{k}, 'Marker', Markers1{k}, 'MarkerSize', 10, ...
         'MarkerEdgeColor', EClr1{k}, 'MarkerFaceColor', MFClr1{k}, ...
         'MarkerIndices', MarkerIndices, 'DisplayName', sprintf('$n = %.2f$', n_val(k)));
end
set(gca, "XScale", "log");
axis tight;
hold off;

% Formatting the plot
set(gca, 'FontSize', 24, 'LineWidth', 1.3, 'TickLabelInterpreter', 'latex');
xlabel('\textbf{$L_s^*$}', 'Interpreter', 'latex', 'FontSize', 24);
ylabel('\textbf{$Q_r$}', 'Interpreter', 'latex', 'FontSize', 24);

% Customize the legend
legend('Location', 'northeast', 'FontSize', 24, 'Interpreter', 'latex');
legend boxoff;

% Adjust figure size
set(gcf, 'Position', [100 50 750 650]);
box on;
