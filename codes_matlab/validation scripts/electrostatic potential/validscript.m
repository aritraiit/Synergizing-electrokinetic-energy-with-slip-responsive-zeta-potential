clear; clc; close all;

Ls_values = [0.3, 0.15];
data = load('validation.txt');  

x      = data(:,1);
psi1   = data(:,2);
psi2   = data(:,3);
indices = round(linspace(1, length(x), 10));

% Sample the vectors at those indices
x1   = x(indices);
psi3 = psi1(indices);
psi4 = psi2(indices);

[my_co1, Lwd1, Lst1, Markers1, MFClr1, EClr1] = linepltaccesories();
legendCell = strcat('$\L_s^* = $', string(num2cell(Ls_values)));

MarkerIndices = round(linspace(1, length(x), 10));
figure;
plot(x, psi1, 'LineWidth', Lwd1{3}, 'Color', my_co1{3}, ...
         'LineStyle', Lst1{1}, ...
         'DisplayName', sprintf('$L_s^* = %.2f$', Ls_values(1)));
hold on;
plot(x, psi2, 'LineWidth', Lwd1{4}, 'Color', my_co1{5}, ...
         'LineStyle', Lst1{2},  ...
         'DisplayName', sprintf('$L_s^* = %.2f$', Ls_values(2)));
hold on;
h_marker = plot(x1, psi3, '^', 'MarkerSize', 10, ...
                'MarkerFaceColor', my_co1{2}, 'MarkerEdgeColor', my_co1{2}, ...
                'LineStyle', 'none', 'DisplayName', 'Soong et. al');
% For psi4: use the same marker style, but exclude from the legend
plot(x1, psi4, '^', 'MarkerSize', 10, ...
     'MarkerFaceColor', my_co1{2}, 'MarkerEdgeColor', my_co1{2}, ...
     'LineStyle', 'none', 'HandleVisibility', 'off');
set(gca, 'FontSize', 24, 'LineWidth', 1.3, 'TickLabelInterpreter', 'latex');
xlabel('\textbf{$y^*$}', 'Interpreter', 'latex', 'FontSize', 24);
ylabel('\textbf{$\psi^*$}', 'Interpreter', 'latex', 'FontSize', 24);

l1 = legend('Location', 'northeast', 'FontSize', 24, 'Interpreter', 'latex');
legend boxoff;
set(gcf, 'Position', [100 50 750 650]);
box on;
