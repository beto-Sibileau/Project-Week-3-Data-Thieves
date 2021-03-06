
clc; clear variables; close all;

% data from pandas
% A = csvread('spainTotCaseStock.csv',1,3);
% filename,R1,C1,[R1 C1 R2 C2]
% b = csvread('spainTotCaseStock.csv',1,2,[1 2 77 2]);

% B = readtable('spainTotCaseStock.csv');
% stringStock = '$\mathrm{IBEX}$';

% Ytick = 0:25000:B{end,4};
% YtickLab = {0:25000:B{end,4}};
% 
% Ylim = [5000 11000];
% YlabStock = 5000:1000:11000;
% YlabTick = {5000:1000:11000};

% B = readtable('italyTotCaseStock.csv');
% stringStock = '$\mathrm{IMIB}$';
% Ytick = 0:28000:B{end,4};
% YtickLab = {0:28000:B{end,4}};
% 
% Ylim = [8 16];
% YlabStock = 8:2:16;
% YlabTick = {8:2:16};

% B = readtable('germanyTotCaseStock.csv');
% stringStock = '$\mathrm{GDAXI}$';
% 
% Ytick = 0:22000:132000;
% YtickLab = {0:22000:132000};
% 
% Ylim = [8000 14000];
% YlabStock = 8000:2000:14000;
% YlabTick = {8000:2000:14000};

% B = readtable('usTotCaseStock.csv');
% stringStock = '$\mathrm{DJI}$';

% Ytick = 0:95000:665000;
% YtickLab = {0:95000:665000};
% 
% Ylim = [17000 31000];
% YlabStock = [17000:5000:31000,31000];
% YlabTick = {[17000:5000:31000,31000]};

B = readtable('chinaTotCaseStock.csv');
stringStock = '$\mathrm{SSE}$';

% Ytick = 0:B{end,4}/6:B{end,4};
% YtickLab = {0:B{end,4}/6:B{end,4}};

Ytick = [0:17000:B{end,4},B{end,4}];
YtickLab = {0:17000:B{end,4},B{end,4}};

Ylim = [2500 3300];
YlabStock = [2500:300:3300,3300];
YlabTick = {[2500:300:3300,3300]};

x = 1:size(B{:,4},1);
y = B{:,5};

xs = x(~isnan(y));
ys = y(~isnan(y));
yi = interp1(xs, ys, x, 'Linear');

startdate = datetime(B{1,3});
enddate = datetime(B{end,3});
x = startdate:enddate;

[hAx,hLine1,hLine2] = plotyy(x,B{:,4},x,yi);
h = xlabel('$\mathrm{Dates}$');
set(h,'Interpreter','latex','FontSize',16);
h = ylabel(hAx(1),'$\mathrm{Total\;cases}$');
set(h,'Interpreter','latex','FontSize',16);
h = ylabel(hAx(2),stringStock);
set(h,'Interpreter','latex','FontSize',16);

set(hAx(1),'YLim',[0 B{end,4}])
set(hAx(1),'YTick',Ytick)
set(hAx(1),'YTickLabel',YtickLab)

set(hAx(2),'YLim',Ylim)
set(hAx(2),'YTick',YlabStock)
set(hAx(2),'YTickLabel',YlabTick)

set(hAx(1),'TickLabelInterpreter','latex','XTickLabelRotation',90);
set(hAx(1),'FontSize',16);

set(hAx(2),'TickLabelInterpreter','latex','XTickLabelRotation',90);
set(hAx(2),'FontSize',16);

set(hLine1,'LineWidth',2);
set(hLine2,'LineWidth',2);

ax1=gca;
ax1_old_pos=ax1.Position; % [ax ay bx by] 2 diagonal points defining the graph area
Allscale=0.9;
X1scale=0.85;
Xscale = 1.4;
Upscale=2.1;
Yscale=2.1;
ax1.Position=[ax1_old_pos(1)*Xscale ax1_old_pos(2)*Yscale ax1_old_pos(3)*X1scale ax1_old_pos(4)*Allscale];
