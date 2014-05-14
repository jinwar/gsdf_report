clear;

load database_sum.mat
setup_parameters;

figure(59)
clf
set(gcf,'color','w');
drawlocal
plotm(stlas,stlos,'bv','markerfacecolor','b')
filename = fullfile('htmls','pics','station_map.png');
print('-dpng','-r300',filename)

figure(59)
clf
clat = mean(lalim); clon = mean(lolim);
[dists azis] = distance(clat,clon,evlas,evlos);
h = rose(azis);
set(gca,'View',[-90 90],'YDir','reverse');
x = get(h,'Xdata');
y = get(h,'Ydata');
g=patch(x,y,'b');
filename = fullfile('htmls','pics','event_azi.png');
print('-dpng','-r300',filename)

figure(59)
clf
worldmap('world');
coastdata = load('coastline_data_low');
coast.lat = coastdata(:,2);
coast.lon = coastdata(:,1);
boundary_data = load('global_trenches_AV.out');
boundary.lat = boundary_data(:,2);
boundary.lon = boundary_data(:,1);
plotm(coast.lat,coast.lon,'k');
plotm(boundary.lat,boundary.lon,'b');
plotm(evlas,evlos,'rv','markerfacecolor','r');

filename = fullfile('htmls','pics','event_map.png');
print('-dpng','-r300',filename)
