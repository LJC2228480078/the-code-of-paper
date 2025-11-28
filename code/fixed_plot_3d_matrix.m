function fixed_plot_3d_matrix(matrix_3d, alpha_vec)
     % 输入检查
    if size(matrix_3d) ~= [4, 6, 11]
        error('Matrix must be 4×6×11 (4 fuzzy numbers × 6 indicators × 11 alpha values)');
    end
    if length(alpha_vec) ~= 11
        error('alpha_vec must contain 11 values (e.g., 0:0.1:1)');
    end
    
    % 初始化参数
    fuzzy_names = {'$\tilde{E}_1$', '$\tilde{E}_2$', '$\tilde{E}_3$', '$\tilde{E}_4$'};
    colors = lines(4);  % 4 distinct colors
    
    % --------------------------
    % 1. Mag_S vs. alpha curve
    % --------------------------
    figure('Position', [100, 100, 800, 600]);
    hold on; 
    for i = 1:4  % Iterate over 4 fuzzy numbers
        mag_values = squeeze(matrix_3d(i, 2, :));
        plot(alpha_vec, mag_values, 'Color', colors(i, :), ...
             'LineWidth', 2.2, 'Marker', 'o', 'MarkerSize', 5);
    end
    xlabel('α Value'); ylabel('Mag_S Value');
    legend(fuzzy_names, 'Location', 'southwest','Interpreter', 'latex');
    box on;
    set(gca,'LineWidth', 2,'TickLabelInterpreter', 'latex');
    
    % --------------------------
    % 2. Ranking results vs. alpha curve
    % --------------------------
    figure('Position', [300, 200, 800, 600]);
    hold on; 
    for i = 1:4  % Iterate over 4 fuzzy numbers
        rank_values = squeeze(matrix_3d(i, 6, :));
        plot(alpha_vec, rank_values, 'Color', colors(i, :), ...
             'LineWidth', 2.2, 'Marker', 's', 'MarkerSize', 5);
    end
    xlabel('α Value'); ylabel('Ranking Result');
    legend(fuzzy_names, 'Location', 'northeast','Interpreter', 'latex');
    box on;
    set(gca, 'LineWidth', 2,'TickLabelInterpreter', 'latex');
    
    % --------------------------
    % 3. Fuzzy number images
    % --------------------------
    figure('Position', [500, 300, 800, 600]);
    hold on;
    % 绘制每个模糊数的隶属函数
    x1 = linspace(2,8, 1000);
    y1 = fuzzynumberplot(x1,2,5,5,8,1);
    x2 = linspace(3,9, 1000);
    y2 = fuzzynumberplot(x2,3,4.5,4.5,9,1);
    x3 = linspace(1,7, 1000);
    y3 = fuzzynumberplot(x3,1,5.5,5.5,7,1);
    x4 = linspace(5,15, 1000);
    y4 = fuzzynumberplot(x4,5,10,10,15,1);
    
    plot(x1, y1, 'LineWidth', 2.2, 'DisplayName', '$\tilde{E}_1$');
    plot(x2, y2, 'LineWidth', 2.2, 'DisplayName', '$\tilde{E}_2$');
    plot(x3, y3, 'LineWidth', 2.2, 'DisplayName', '$\tilde{E}_3$');
    plot(x4, y4, 'LineWidth', 2.2, 'DisplayName', '$\tilde{E}_4$');
    
    xlim([0, 18])
    ylim([0, 1])
    xlabel("x")
    ylabel("u_E(x)")
    set(gca, 'LineWidth', 2)
    legend('Location', 'northwest', 'Interpreter', 'latex');
    box on;
    set(gca, 'TickLabelInterpreter', 'latex');
    
    % --------------------------
    % 4. Skewness vs. Variance comparison
    % --------------------------
    figure('Position', [700, 400, 800, 600]);
    skew_vals = [matrix_3d(1, 5, 1); -matrix_3d(2, 5, 1);  % Column 5 is skewness
                 -matrix_3d(3, 5, 1); matrix_3d(4, 5, 1)];
    sigma_vals = [matrix_3d(1, 4, 1); matrix_3d(2, 4, 1);  % Column 4 is standard deviation
                  matrix_3d(3, 4, 1); matrix_3d(4, 4, 1)];
    var_vals = sigma_vals.^2;  % Variance = (Standard Deviation)^2
    
    bar_width = 0.35;
    x = 1:4;
    bar(x - bar_width/2, skew_vals, bar_width, 'FaceColor', [0.8, 0.2, 0.2]);
    hold on;
    bar(x + bar_width/2, var_vals, bar_width, 'FaceColor', [0.2, 0.5, 0.8]);
    xlabel('Fuzzy Number'); ylabel('Value');ylim([-3,19])
    legend('Skewness', 'Variance','Location', 'northwest','Interpreter', 'latex');
    xticks(x);
    xticklabels(fuzzy_names);
    set(gca,'LineWidth', 1.5,'TickLabelInterpreter', 'latex');
    box on;
end