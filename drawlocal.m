ax = worldmap(lalim,lolim);
setm(ax,'fontsize',18);
coastdata = load('coastline_data_low');
coast.lat = coastdata(:,2);
coast.lon = coastdata(:,1);
boundary_data = load('global_trenches_AV.out');
boundary.lat = boundary_data(:,2);
boundary.lon = boundary_data(:,1);
plotm(coast.lat,coast.lon,'k','linewidth',2);
plotm(boundary.lat,boundary.lon,'--b','linewidth',2);

