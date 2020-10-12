function out = plot_y_yfit_simple(yval, yfit, varargin)

xlim = [-0.1 1.1];
ylim = [-0.04 0.04];
data_alpha  = 1;
line_alpha  = 1;
dotsize = 40;

for i = 1:length(varargin)
    if ischar(varargin{i})
        switch varargin{i}
            % functional commands
            case {'xlim'}
                xlim = varargin{i+1};
            case {'ylim'}
                ylim = varargin{i+1};
            case {'dotsize'}
                dotsize = varargin{i+1};
        end
    end
end

create_figure('y_yfit_plot');

b = glmfit(yval, yfit);
out.b = b(2);
line_h = line(xlim, b'*[ones(1,2); xlim], 'linewidth', 1.5, 'color', [0 0 0]);
line_h.Color(4) = 1;
hold on;
scatter(yval, yfit, dotsize, 'MarkerFaceColor', [.75 .75 .75], 'MarkerEdgeColor', [.3 .3 .3], ...
    'MarkerFaceAlpha', .9, 'MarkerEdgeAlpha', 1);
set(gca, 'tickdir', 'out', 'TickLength', [.03 .03], 'linewidth', 1.5, 'xlim', xlim, 'ylim', ylim, 'fontsize', 14);
set(gcf, 'position', [360   536   197   162]);
r = corrcoef(yval,yfit);
out.r = r(1,2);

end