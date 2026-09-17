function fig = plot_subplot(year, data, labels, layout, ...
    title_name, ylabel_name, filename)
% PLOT_SUBPLOT Create multiple line charts in subplots.
%
% Inputs:
%   year        - Year vector (T x 1)
%   data        - Data matrix (T x N), each column is one series
%   labels      - Cell array of subplot titles, length N
%   layout      - Two-element vector [nRows, nCols]
%   title_name  - Overall figure title
%   ylabel_name - Y-axis label for each subplot
%   filename    - Output filename, e.g. 'Figure4.png'
%
% Output:
%   fig         - Figure handle

    % Check
    if size(data, 1) ~= length(year)
        error('The number of rows in data must match the length of year.');
    end

    if size(data, 2) ~= length(labels)
        error('The number of data columns must match the number of labels.');
    end

    % Settings
    nRows = layout(1); % subplot layout
    nCols = layout(2);
    nPlots = nRows * nCols;

    if size(data, 2) > nPlots
        error('The subplot layout does not have enough positions.');
    end


    fig = figure('Color', 'w', 'Units', 'inches', 'Position',[1,1,10,6.5]); % figure settings

    for i = 1:size(data, 2)     % subplots settings

        ax = subplot(nRows, nCols, i);
        plot(year, data(:, i), 'Color', [0.15, 0.15, 0.15], 'LineWidth', 1.5);

        % axes formatting
        ax.FontName = 'Times New Roman';
        ax.FontSize = 9;
        ax.LineWidth = 0.7;
        ax.Box = 'off';

        ax.XGrid = 'off';
        ax.YGrid = 'off';
        %ax.GridLineStyle = '--';
        %ax.GridAlpha = 0.15;

        title(labels{i}, ...
            'FontName', 'Times New Roman', ...
            'FontSize', 9, ...
            'FontWeight', 'normal', ...
            'Interpreter', 'none');
        xlabel('Year', ...
            'FontName', 'Times New Roman', ...
            'FontSize', 9);
        ylabel(ylabel_name, ...
            'FontName', 'Times New Roman', ...
            'FontSize', 9);

        % X-axis ticks
        row = ceil(i / nCols);

        if row == nRows

            % display Year on bottom row only
            xlabel('Year', ...
                'FontName', 'Times New Roman', ...
                'FontSize', 9);

            xticks(year);

            if length(year) > 15
                xticks(year(1:2:end));
            end

        else

            ax.XTick = [];
            ax.XTickLabel = [];
            ax.XLabel.String = '';

        end

    end

    % turn off unused subplot positions
    for i = size(data, 2)+1:nPlots

        subplot(nRows, nCols, i);
        axis(ax, 'off');

    end

    % Overall title
    sgtitle(title_name, ...
        'FontSize', 12, ...
        'FontWeight', 'bold');

    % Save figure
    if nargin >= 7 && ~isempty(filename)
        exportgraphics(fig, filename, 'Resolution', 300);
    end

end