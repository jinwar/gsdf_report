clear;

load database_sum.mat
setup_parameters;

%----------------- map of stations ------------
fig=figure('units','pixels','outerposition',[50 50 800 600 ],'paperpositionmode','auto');  %   left up width height
set(gcf,'renderer','zbuffer')
clf
subplot('Position',[0.08 0.08 0.9 0.8 ]);
set(gcf,'color','w');
drawlocal
plotm(stlas,stlos,'b^','markerfacecolor','b')
filename = fullfile('htmls','pics','station_map.png');
title(parameters.proj_name,'fontsize',14)
print('-dpng','-r150',filename)
close(fig)

%----------- rose plot of azimuthal distribution of events ----------
fig=figure('units','pixels','outerposition',[50 50 650 600 ],'paperpositionmode','auto');  %   left up width height
set(gcf,'renderer','zbuffer')
clf
subplot('Position',[0.1 0.1 0.8 0.8 ]);
clat = mean(lalim); clon = mean(lolim);
[dists azis] = distance(clat,clon,evlas,evlos);
h = rose(azis);
set(gca,'View',[-90 90],'YDir','reverse');
x = get(h,'Xdata');
y = get(h,'Ydata');
g=patch(x,y,'b');
distxy=sqrt((x.^2)+(y.^2));
set(findall(gcf,'type','text'),'fontSize',14)
filename = fullfile('htmls','pics','event_azi.png');
subplot('position',[0.5,0.025,0.01,0.01]);
axis off
text(0,0,'Azimuthal distribution of events','HorizontalAlignment','center','fontsize',14);
subplot('position',[0.95,0.95,0.01,0.01]);
axis off
text(0,0,parameters.proj_name,'fontsize',14,'HorizontalAlignment','right','backgroundcolor','w');
print('-dpng','-r100',filename)
close(fig)

%----------------- map of events ------------
fig=figure('units','pixels','outerposition',[50 50 900 500 ],'paperpositionmode','auto');  %   left up width height
set(gcf,'renderer','zbuffer')
clf
subplot('Position',[0.01 0.04 0.97 0.89]);
worldmap('world');
mlabel('off')
plabel('off')
coastdata = load('coastline_data_low');
coast.lat = coastdata(:,2);
coast.lon = coastdata(:,1);
boundary_data = load('global_trenches_AV.out');
boundary.lat = boundary_data(:,2);
boundary.lon = boundary_data(:,1);
plotm(coast.lat,coast.lon,'k');
plotm(boundary.lat,boundary.lon,'--','color',[0.6 0.6 1]);
plotm(evlas,evlos,'rv','markerfacecolor','r');
y=parameters.lolim;
x=parameters.lalim;
plotm([x(1) x(1)],[y(1) y(2)],'color',[0 0.8 0],'linewidth',2);
plotm([x(1) x(2)],[y(1) y(1)],'color',[0 0.8 0],'linewidth',2);
plotm([x(2) x(2)],[y(1) y(2)],'color',[0 0.8 0],'linewidth',2);
plotm([x(1) x(2)],[y(2) y(2)],'color',[0 0.8 0],'linewidth',2);
titlemap=sprintf('Event distribution for %s',parameters.proj_name);
title(titlemap,'fontsize',14)

filename = fullfile('htmls','pics','event_map.png');
print('-dpng','-r150',filename)
close(fig)

