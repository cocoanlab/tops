function [h_line, h_patch] = trace_plot_overlap(data1, data2, varargin)

color1 = [0         0         0];
color2 = [0.8902    0.1020    0.1098];
alpha1 = 0.3;
alpha2 = 0.3;

for i = 1:length(varargin)
    if ischar(varargin{i})
        switch varargin{i}
            case {'color1'} 
                color1 = varargin{i+1};
            case {'color1'} 
                color2 = varargin{i+1};
            case {'alpha1'} 
                alpha1 = varargin{i+1};
            case {'alpha2'}
                alpha2 = varargin{i+1};
        end
    end
end

create_figure('trace_plot_overlap');
hold on;

[n_data1, t_data1] = size(data1);
mean_data1 = mean(data1);
ste_data1 = std(data1) ./ (n_data1 .^ 0.5);

ylim_data1 = [min(mean_data1) - (max(mean_data1)-min(mean_data1))*0.3, ...
    max(mean_data1) + (max(mean_data1)-min(mean_data1))*0.3];

yyaxis left;
h_patch(1) = patch([1:t_data1, fliplr(1:t_data1), 1], ...
    [mean_data1-ste_data1, fliplr(mean_data1+ste_data1), mean_data1(1)-ste_data1(1)], ...
    'y', 'linestyle', 'none', 'FaceColor', color1, 'faceAlpha', alpha1);
h_line(1) = plot(1:t_data1, mean_data1, '-', 'linewidth', 2, 'color', color1, 'MarkerSize', 4, 'MarkerFaceColor', color1);
set(gca, 'ylim', ylim_data1, 'YColor', color1);

[n_data2, t_data2] = size(data2);
mean_data2 = mean(data2);
ste_data2 = std(data2) ./ (n_data2 .^ 0.5);

ylim_data2 = [min(mean_data2) - (max(mean_data2)-min(mean_data2))*0.3, ...
    max(mean_data2) + (max(mean_data2)-min(mean_data2))*0.3];

yyaxis right;
h_patch(2) = patch([1:t_data2, fliplr(1:t_data2), 1], ...
    [mean_data2-ste_data2, fliplr(mean_data2+ste_data2), mean_data2(1)-ste_data2(1)], ...
    'y', 'linestyle', 'none', 'FaceColor', color2, 'faceAlpha', alpha2);
h_line(2) = plot(1:t_data2, mean_data2, '-', 'linewidth', 2, 'color', color2, 'MarkerSize', 4, 'MarkerFaceColor', color2);
set(gca, 'ylim', ylim_data2, 'YColor', color2);

set(gca, 'fontsize', 18, 'linewidth', 1.5, 'tickdir', 'out', 'ticklength', [.03 .03]);
set(gcf, 'position', [5   930   334   229]);


end