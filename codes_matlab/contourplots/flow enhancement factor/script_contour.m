clc;
clear;
close all;

fileNames = ["muek_4a_Ls_0.txt", "muek_4a_Ls_0p1.txt", "muek_4a_Ls_0p25.txt", "muek_4a_Ls_0p4.txt", "muek_4a_Ls_1p3.txt"];
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
F = scatteredInterpolant(Ls_list, n_values, Es_values, 'linear', 'none');

% Define grid for plotting
n_val = logspace(log10(0.5), log10(1.5), 100); % Logarithmic spacing for n
Ls_val = logspace(log10(1e-5), log10(1.3), 100); % Logarithmic spacing for Ls
[Lsm, nm] = meshgrid(Ls_val, n_val);

% Interpolate Es values on the grid
Es_interp = F(Lsm, nm);

% Plot contourf
figure;
contourf(Lsm, nm, Es_interp.^-1, 20, 'LineColor', 'none'); 
hold on;
[C, h] = contour(Lsm, nm, Es_interp.^-1, [1 1], 'LineColor', 'w', 'LineWidth', 2.5); 
clabel(C, h, 'FontSize', 18, 'Color', 'w', 'FontWeight', 'bold', ...
       'Interpreter', 'latex', 'LabelSpacing', 1000, 'FontName', 'Times');
hold off;

% Colormap settings
% cmap = brewermap(200, 'RdYlBu'); 
% cmap_flipped = flipud(cmap); 
% colormap(cmap_flipped);
colormap("plasma");

% Plot formatting
set(gcf, 'Position', [100 50 750 650]);
xlabel('$L_s^*$', 'Interpreter', 'latex', 'FontSize', 26);
ylabel('$n$', 'Interpreter', 'latex', 'FontSize', 26);
ax = gca;
axis tight;
set(gca, 'LineWidth', 1.3);
set(gca, 'FontSize', 24);
set(gca, 'TickLabelInterpreter', 'latex');
set(gca, 'XScale', 'log', 'YScale', 'log'); % Log scales

% Colorbar settings
hb = colorbar;
set(hb, 'TickLabelInterpreter', 'latex', 'FontSize', 24);

box on;
