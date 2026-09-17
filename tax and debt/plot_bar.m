function fig = plot_bar(year, data, labels, title_name, ylabel_name, filename)
% PLOT_BAR Create a bar chart for one or multiple data series.
%
% Inputs:
%   year        - Year vector (T x 1)
%   data        - Data matrix (T x N), each column is one series
%   labels      - Cell array of series names
%   title_name  - Figure title
%   ylabel_name - Y-axis label
%   filename    - Output filename, e.g. 'Figure6.png'
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
    fig = figure('Color', 'w', 'Units', 'inches', 'Position',[1,1,8,5]); % figure setting

    b = bar(year, data, 'grouped'); % plot grouped bar chart

    nSeries = length(b); % grayscale styles
    grayLevels = linspace(0.85, 0.25, max(nSeries, 2));

    for i = 1:nSeries

        b(i).FaceColor = [grayLevels(i), grayLevels(i), grayLevels(i)];
        b(i).EdgeColor = [0.1, 0.1, 0.1];
        b(i).LineWidth = 0.8;

    end


    ax = gca; % axes formatting

    ax.FontName = 'Times New Roman';
    ax.FontSize = 11;
    ax.LineWidth = 0.8;
    ax.Box = 'off';

    ax.XGrid = 'off';
    ax.YGrid = 'off';
    %ax.GridLineStyle = '--';
    %ax.GridAlpha = 0.15;

    xlabel('Year', 'FontName', 'Times New Roman', 'FontSize', 11);
    ylabel(ylabel_name, 'FontName', 'Times New Roman', 'FontSize', 11);
    title(title_name, ...
        'FontName', 'Times New Roman', ...
        'FontSize', 12, ...
        'FontWeight', 'normal');


    xticks(year) % x-axis ticks
    if length(year) > 15
        xticks(year(1:2:end));
    end


    if size(data, 2) > 1 % legend

        legend(labels, ...
            'Location', 'northoutside', ...
            'Orientation', 'horizontal', ...
            'Box', 'off', ...
            'FontName', 'Times New Roman', ...
            'FontSize', 10, ...
            'Interpreter', 'none');

    end


    % Save figure
    if nargin >= 6 && ~isempty(filename)

        exportgraphics(fig, filename, 'Resolution', 300);

    end

end