
%% To find and plot which beta produces minimumum estimation error (produces MinErrorBeta.eps)
%%
% 3 beta till third lowest error is plotted

% RE = load('relative_errorline.mat');
% RE = load('/home/userb/work/matlab/MATLAB_Drive/MATLAB_Drive/BhaveshSharedFolder/(setsize)MeanActivationToNumber/redundant/relative_error_line.mat');
 %RE = load('relative_error_line_monotonus.mat');
RE = load('relative_error_monotonus_all_t50.mat');
RE = load('relative_error_monotonus_Pre_calc.mat');


RE = RE.relative_error;
% RE = RE.ans;
% RE=relative_error;
[min_er1,I] = min(RE(:,:,4),[],2);
min_b1 = RE(1,I,2);
j=0;

for i =1:length(I)
    index = I(i);
    j=j+1;
    RE(j,index,4) = 10;
end
[min_er2,I] = min(RE(:,:,4),[],2);
min_b2 = RE(1,I,2);

j=0;
for i =1:length(I)
    index = I(i);
    j=j+1;
    RE(j,index,4) = 10;
end

[min_er3,I] = min(RE(:,:,4),[],2);
min_b3 = RE(1,I,2);

%
x=RE(:,1,1);
y=min_b1';
% g = fittype('a-b*exp(-c*x)');
min1fit = fit(x,y,'exp2');

%%

figure('Units', 'pixels', ...
'Position', [100 100 500 375]);
hold on;
min1=line(RE(:,1,1),(min_b1));
min2=line(RE(:,1,1),(min_b2));
min3=line(RE(:,1,1),(min_b3));

xx = linspace(1,50,150);
fitmin1=line(xx,min1fit(xx));

set(fitmin1                        , ...
  'LineStyle'       , '--'        , ...
  'Color'           , [0 0 .75]         );
set(min1                            , ...
  'LineStyle'       , 'none'      , ...
  'Marker'          , '.'         );
set(min2                            , ...
  'LineStyle'       , 'none'      , ...
  'Marker'          , '.'         );
set(min3                            , ...
  'LineStyle'       , 'none'      , ...
  'Marker'          , '.'         );
set(min1                         , ...
  'Marker'          , 'o'         , ...
  'MarkerSize'      , 7           , ...
  'MarkerEdgeColor' , 'none'      , ...
  'MarkerFaceColor' , [0 0 .75] );
set(min2                         , ...
  'Marker'          , 'o'         , ...
  'MarkerSize'      , 5           , ...
  'MarkerEdgeColor' , 'none'      , ...
  'MarkerFaceColor' , [.5 .5 .6] );
set(min3                         , ...
  'Marker'          , 'o'         , ...
  'MarkerSize'      , 3           , ...
  'MarkerEdgeColor' , 'none'      , ...
  'MarkerFaceColor' , [.5 .5 .5] );

% hTitle  = title ('');
hXLabel = xlabel('Numerosity'                     );
hYLabel = ylabel('Inhibition strength'                      );

c=0.0995;
C=0.1;
hText   = text(10, 800, ...
  sprintf('htext..'));

hLegend = legend( ...
  [min1, min2, min3, fitmin1], ...
  '\beta for least error' , ...
  '\beta for second least error'      , ...
  '\beta for third least error'       , ...
  'Exponential fit(least error)'    , ...
  'location', 'Northeast' );
%
set( gca                       , ...
    'FontName'   , 'Helvetica' );
% set([hTitle,hXLabel, hYLabel, hText], ...
set([hXLabel, hYLabel, hText], ...
     'FontName'   , 'AvantGarde');
set([hLegend, gca]             , ...
    'FontSize'   , 8           );
set([hXLabel, hYLabel, hText]  , ...
    'FontSize'   , 10          );
% set( hTitle                    , ...
%     'FontSize'   , 12          , ...
%     'FontWeight' , 'bold'      );

set(gca, ...
  'Box'         , 'off'     , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'off'      , ...
  'YMinorTick'  , 'off'      , ...
  'YGrid'       , 'off'      , ...
  'XGrid'       , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3], ...
  'YTick'       , 0.01:0.01:.15, ...
  'XTick'       , [1:9,10:5:50], ...
  'LineWidth'   , 1         );

set(gcf, 'PaperPositionMode', 'auto');
print -depsc2 MinErrorBeta1.eps

fixPSlinestyle('finalPlot1.eps', 'finalPlot2.eps');

