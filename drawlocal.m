ax = worldmap(lalim,lolim);
setm(ax,'fontsize',18);
coastdata = load('coastline_data_low');
coast.lat = coastdata(:,2);
coast.lon = coastdata(:,1);
boundary_data = load('global_trenches_AV.out');
boundary.lat = boundary_data(:,2);
boundary.lon = boundary_data(:,1);
plotm(coast.lat,coast.lon,'k','linewidth',2);
plotm(boundary.lat,boundary.lon,'--','linewidth',1,'color',[0.6 0.6 1]);
setm(gca,'labelformat','none');
setm(ax,'mlabelparallel',min(lalim))

lomid=mean(lolim);
difflo=max(lolim)-min(lolim);
clo=ceil(min(lolim));
flo=floor(max(lolim));
dcflo=flo-clo;
if ( dcflo >= 60 && dcflo < 180 )
   setm(ax,'mlabelround',0)
   setm(gca,'mlinelocation',[ clo:20:flo ]);
   setm(gca,'mlabellocation',[ clo:20:flo ]);
elseif ( dcflo >= 30 )
   setm(ax,'mlabelround',0)
   setm(gca,'mlinelocation',[ clo:10:flo ]);
   setm(gca,'mlabellocation',[ clo:10:flo ]);
elseif ( dcflo >= 20 )
   setm(ax,'mlabelround',0)
   setm(gca,'mlinelocation',[ clo:5:flo ]);
   setm(gca,'mlabellocation',[ clo:5:flo ]);
elseif ( dcflo >= 12 )
   setm(ax,'mlabelround',0)
   setm(gca,'mlinelocation',[ clo:4:flo ]);
   setm(gca,'mlabellocation',[ clo:4:flo ]);
elseif ( dcflo > 6 )
   setm(ax,'mlabelround',0)
   setm(gca,'mlinelocation',[ clo:3:flo ]);
   setm(gca,'mlabellocation',[ clo:3:flo ]);
elseif ( dcflo > 2 )
   setm(ax,'mlabelround',0)
   setm(gca,'mlinelocation',[ clo:2:flo ]);
   setm(gca,'mlabellocation',[ clo:2:flo ]);
else
   setm(ax,'mlabelround',-2)
   setm(gca,'mlinelocation',[ min(lolim) lomid max(lolim) ]);
   setm(gca,'mlabellocation',[ min(lolim) lomid max(lolim) ]);
end

