clear;

load database_sum.mat
lalim = [25 50];
lolim = [-125 -65];

figure(59)
clf
set(gcf,'color','w');
set(gcf,'position',[289   314   800   400]);
axes('position',[0.05 0.1 0.8 0.8])
ax = usamap(lalim,lolim);
land = shaperead('landareas', 'UseGeoCoords', true);
geoshow(ax, land, 'FaceColor', [0.5 0.5 0.5])
lakes = shaperead('worldlakes', 'UseGeoCoords', true);
geoshow(lakes, 'FaceColor', [0.5 0.5 0.5])
states = shaperead('usastatehi',...
        'UseGeoCoords', true, 'BoundingBox', [lolim', lalim']);
geoshow(ax, states, 'FaceColor', [0.5 0.5 0.5],'linewidth',0.1)
%S = load('wus_boundary.mat');
%plotm(S.lat,S.lon,'k');
setm(gca,'mlabellocation',20)
setm(gca,'plabellocation',10)
gridm off
plotm(stlas,stlos,'bv','markerfacecolor','b')

%axes('position',[0.70 0.05 0.2 0.4])
%set(gca,'YTick',[])
%set(gca,'YColor','w')
%set(gca,'XTick',[])
%set(gca,'XColor','w')
%box on
axes('position',[0.65 0.1 0.3 0.4])
%set(gca,'fontsize',15)
clat = mean(lalim); clon = mean(lolim);
[dists azis] = distance(clat,clon,evlas,evlos);
h = rose(azis);
set(gca,'View',[-90 90],'YDir','reverse');
x = get(h,'Xdata');
y = get(h,'Ydata');
g=patch(x,y,'b');
%polargeo(azis,dists,'.');
%ax = worldmap('world');
%setm(gca,'meridianlabel','off');
%setm(gca,'parallellabel','off');
%load coast;
%plotm(lat,long,'k');
%plotm(evlas,evlos,'o','markerfacecolor','b');

filename = fullfile('htmls','report_files','station_event_map.png');
%export_fig(filename,'-png');
        print('-dpng','-r300',filename)

