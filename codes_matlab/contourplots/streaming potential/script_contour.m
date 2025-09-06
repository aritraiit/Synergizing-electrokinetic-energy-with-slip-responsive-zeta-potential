clc;
clear;
close all;

fileNames = ["Es_n_K_0p1.txt", "Es_n_K_0p5.txt", "Es_n_K_1.txt", "Es_n_K_5.txt", "Es_n_K_10.txt"];
K_values = [0.1, 0.5, 1, 5, 10];

% Initialize storage arrays
n_values = []; 
K_list = []; 
Es_values = [];

% Loop through files
for i = 1:length(fileNames)
    % Read data from file
    data = readmatrix(fileNames(i));
    
    % Extract x and Es values
    x = data(:,1); % X values (not needed for interpolation)
    Es_matrix = data(:,2:end); % Extract Es values for different n

    % Define n values from column headers
    n_range = linspace(0.5, 1.2, size(Es_matrix, 2)); % Assuming evenly spaced n
    
    % Store values in vectors
    for j = 1:length(n_range)
        n_values = [n_values; n_range(j) * ones(size(Es_matrix, 1), 1)];
        K_list = [K_list; K_values(i) * ones(size(Es_matrix, 1), 1)];
        Es_values = [Es_values; Es_matrix(:, j)];
    end
end

% Create scattered interpolant function
F = scatteredInterpolant(K_list, n_values, Es_values, 'natural', 'none');

% Define grid for plotting
n_val = logspace(log10(0.5), log10(1.2), 250); % Logarithmic spacing for n
K_val = logspace(log10(0.1), log10(10), 250); % Logarithmic spacing for Ls
[Km, nm] = meshgrid(K_val, n_val);

% Interpolate Es values on the grid
Es_interp = F(Km, nm);

% Plot contourf
figure;
contourf(Km, nm, Es_interp, 20, 'LineColor', 'none'); 
colormap(flipud(brewermap(50,'RdYlGn')))
colorbar; % Add colorbar for reference
set(figure (1), 'Position', [100 50 750 650]);
xlabel('$K$', 'Interpreter', 'latex', 'FontSize', 26);
ylabel('$n$', 'Interpreter', 'latex', 'FontSize', 26);
ax = gca;
% Axis settings
axis tight;
set(gca, 'LineWidth', 1.3);
set(gca, 'FontSize', 24);
set(gca, 'TickLabelInterpreter', 'latex');
% Colorbar settings
hb = colorbar;
set(hb, 'TickLabelInterpreter', 'latex', 'FontSize', 24);

% Enhancing visualization
box on;
set(gca, 'XScale', 'log', 'YScale', 'log'); % Set logarithmic scales


