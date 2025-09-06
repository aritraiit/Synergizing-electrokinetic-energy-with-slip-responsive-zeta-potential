clc;
clear;
close all;

fileNamesNS = ["etas_5a_Ls_0_NS.txt", "etas_5a_Ls_0p1_NS.txt", "etas_5a_Ls_0p25_NS.txt", "etas_5a_Ls_0p4_NS.txt", "etas_5a_Ls_1p3_NS.txt"];
Ls_valuesNS = [0, 0.1, 0.25, 0.4, 1.3];

% Initialize storage arrays
n_valuesNS = []; 
Ls_listNS = []; 
Es_valuesNS = [];

% Loop through files
for i = 1:length(fileNamesNS)
    % Read data from file
    dataNS = readmatrix(fileNamesNS(i));
    
    % Extract x and Es values
    xNS = dataNS(:,1); % X values (not needed for interpolation)
    Es_matrixNS = dataNS(:,2:end); % Extract Es values for different n

    % Define n values from column headers
    n_rangeNS = linspace(0.5, 1.5, size(Es_matrixNS, 2)); % Assuming evenly spaced n
    
    % Store values in vectors
    for j = 1:length(n_rangeNS)
        n_valuesNS = [n_valuesNS; n_rangeNS(j) * ones(size(Es_matrixNS, 1), 1)];
        Ls_listNS = [Ls_listNS; Ls_valuesNS(i) * ones(size(Es_matrixNS, 1), 1)];
        Es_valuesNS = [Es_valuesNS; Es_matrixNS(:, j)];
    end
end

% Create scattered interpolant function
FNS = scatteredInterpolant(Ls_listNS, n_valuesNS, Es_valuesNS, 'natural', 'none');

% Define grid for plotting
n_valNS = logspace(log10(0.5), log10(1.5), 1500); % Logarithmic spacing for n
Ls_valNS = logspace(log10(1e-5), log10(1.3), 1500); % Logarithmic spacing for Ls
[LsmNS, nmNS] = meshgrid(Ls_valNS, n_valNS);

% Interpolate Es values on the grid
Es_interpNS = FNS(LsmNS, nmNS);

%%
fileNames = ["etas_5a_Ls_0.txt", "etas_5a_Ls_0p1.txt", "etas_5a_Ls_0p25.txt", "etas_5a_Ls_0p4.txt", "etas_5a_Ls_1p3.txt"];
Ls_values = [0, 0.1, 0.25, 0.4, 1.3];

% Initialize storage arrays
n_values = []; 
Ls_list = []; 
Es_values = [];

% Loop through files
for i = 1:length(fileNames)
    % Read data from file
    data = readmatrix(fileNames(i));
    
    % Extract x and Es values
    x = data(:,1); % X values (not needed for interpolation)
    Es_matrix = data(:,2:end); % Extract Es values for different n

    % Define n values from column headers
    n_range = linspace(0.5, 1.5, size(Es_matrix, 2)); % Assuming evenly spaced n
    
    % Store values in vectors
    for j = 1:length(n_range)
        n_values = [n_values; n_range(j) * ones(size(Es_matrix, 1), 1)];
        Ls_list = [Ls_list; Ls_values(i) * ones(size(Es_matrix, 1), 1)];
        Es_values = [Es_values; Es_matrix(:, j)];
    end
end

% Create scattered interpolant function
F = scatteredInterpolant(Ls_list, n_values, Es_values, 'natural', 'none');

% Define grid for plotting
n_val = logspace(log10(0.5), log10(1.5), 1500); % Logarithmic spacing for n
Ls_val = logspace(log10(1e-5), log10(1.3), 1500); % Logarithmic spacing for Ls
[Lsm, nm] = meshgrid(Ls_val, n_val);

% Interpolate Es values on the grid
Es_interp = F(Lsm, nm);

% Plot contourf
% figure;
% contourf(Lsm, nm, abs(Es_interp./Es_interpNS), 20, 'LineColor', 'none'); 
% colormap(brewermap(64, 'RdYlBu'));
% colorbar; % Add colorbar for reference
% set(figure (1), 'Position', [100 50 750 650]);
% xlabel('$L_s^*$', 'Interpreter', 'latex', 'FontSize', 26);
% ylabel('$n$', 'Interpreter', 'latex', 'FontSize', 26);
% ax = gca;
% % Axis settings
% axis tight;
% set(gca, 'LineWidth', 1.3);
% set(gca, 'FontSize', 24);
% set(gca, 'TickLabelInterpreter', 'latex');
% % Colorbar settings
% hb = colorbar;
% set(hb, 'TickLabelInterpreter', 'latex', 'FontSize', 24);
% 
% % Enhancing visualization
% box on;
% set(gca, 'XScale', 'log', 'YScale', 'log'); % Set logarithmic scales

%%
% Define the Ls values
Ls_val = logspace(log10(1e-5), log10(1.3), 1500);

% Load line plot accessories
[my_co1, Lwd1, Lst1, Markers1, MFClr1, EClr1] = linepltaccesories();

% Define marker indices for plotting
MarkerIndices_interp = round(linspace(1, length(Ls_val), 10));

% Define the n values to plot
n_values_to_plot = [0.5, 0.8, 1, 1.2];

% Initialize figure
figure;
hold on;
legend_labels = cell(1, length(n_values_to_plot)); % Preallocate legend labels

% Loop through each n value
for k = 1:length(n_values_to_plot)
    n_val = n_values_to_plot(k);
    
    % Compute F and FNS at each Ls for the given n
    F_interp = F(Ls_val, repmat(n_val, size(Ls_val)));
    FNS_interp = FNS(Ls_val, repmat(n_val, size(Ls_val)));
    
    % Compute the ratio F/FNS
    ratio =  FNS_interp;
    
    % Plot the curve
    plot(Ls_val, ratio,...
        'LineWidth',       Lwd1{k}, ...
        'Color',           my_co1{k}, ...
        'LineStyle',       Lst1{k}, ...
        'Marker',          Markers1{k}, ...
        'MarkerSize',      10, ...
        'MarkerEdgeColor', EClr1{k}, ...
        'MarkerFaceColor', MFClr1{k}, ...
        'MarkerIndices',   MarkerIndices_interp);
    
    % Store legend label
    legend_labels{k} = sprintf('$n = %.1f$', n_val);
end

% Set logarithmic scale for x-axis
set(gca, 'XScale', 'log');

% Format plot
set(gca, 'FontSize', 24, 'LineWidth', 1.3, 'TickLabelInterpreter', 'latex');
xlabel('\textbf{$L_s^*$}', 'Interpreter', 'latex', 'FontSize', 24);
ylabel('\textbf{$\frac{\eta_{ek}}{\eta_{N+NS}}$}', 'Interpreter', 'latex', 'FontSize', 24);
legend(legend_labels, 'Interpreter', 'latex', 'Location', 'best');
legend box off;
set(gcf, 'Position', [100, 50, 750, 650]);
box on;
hold off;

