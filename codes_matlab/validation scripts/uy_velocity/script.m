clc;
clear;
close all;

Ls_values = [0.01, 0.1];
data = readmatrix('valid.xlsx');

x    = data(:, 1);
u1 = data(:, 2);
u2 = data(:, 3);

indices = round(linspace(1, length(x), 10));

% Sample the vectors at those indices
x1   = x(indices);
u3 = u1(indices);
u4 = u2(indices);

[my_co1, Lwd1, Lst1, Markers1, MFClr1, EClr1] = linepltaccesories();
legendCell = strcat('$\L_s^* = $', string(num2cell(Ls_values)));

MarkerIndices = round(linspace(1, length(x), 10));
figure;
plot(x, u1, 'LineWidth', Lwd1{3}, 'Color', my_co1{3}, ...
         'LineStyle', Lst1{1}, ...
         'DisplayName', sprintf('$L_s^* = %.2f$', Ls_values(1)));
hold on;
plot(x, u2, 'LineWidth', Lwd1{4}, 'Color', my_co1{4}, ...
         'LineStyle', Lst1{2},  ...
         'DisplayName', sprintf('$L_s^* = %.2f$', Ls_values(2)));
hold on;
h_marker = plot(x1, u3, '^', 'MarkerSize', 10, ...
                'MarkerFaceColor', my_co1{1}, 'MarkerEdgeColor', my_co1{1}, ...
                'LineStyle', 'none', 'DisplayName', 'Liu et. al');
% For psi4: use the same marker style, but exclude from the legend
plot(x1, u4, '^', 'MarkerSize', 10, ...
     'MarkerFaceColor', my_co1{1}, 'MarkerEdgeColor', my_co1{1}, ...
     'LineStyle', 'none', 'HandleVisibility', 'off');
set(gca, 'FontSize', 24, 'LineWidth', 1.3, 'TickLabelInterpreter', 'latex');
xlabel('\textbf{$y^*$}', 'Interpreter', 'latex', 'FontSize', 24);
ylabel('\textbf{$u^*$}', 'Interpreter', 'latex', 'FontSize', 24);
l1 = legend('Location', 'northeast', 'FontSize', 24, 'Interpreter', 'latex');
legend boxoff;
set(gcf, 'Position', [100 50 750 650]);
box on;
