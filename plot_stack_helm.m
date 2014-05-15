% Script to generate html file and figures for the stacked phase velocity result
% written by Ge Jin, jinwar@gmail.com
% May, 2013

clear;

setup_parameters;

r=0.08;
datafile = fullfile(gsdfpath,['helmholtz_stack_',component,'.mat']);

if ~exist('htmls','dir')
	mkdir('htmls');
end
if ~exist(fullfile('htmls','pics'),'dir')
	mkdir(fullfile('htmls','pics'));
end

result = load(datafile);
load seiscmap

Nx = 2; Ny = 4;
sidegap = 0.05; topgap = 0.03; botgap = 0.10; vgap = 0.05; hgap = 0.08;
cbar_bot = 0.04;

width = (1 - vgap*(Nx-1)-2*sidegap)/Nx;
height = (1 - topgap - botgap - (Ny-1)*hgap)/Ny;

% Make the general plot
figure(88)
clf
set(gcf,'renderer','zbuffer')
set(gcf,'color',[1 1 1]);
set(gcf,'position',[150    50   700   900]);
plot_array = [7 8 5 6 3 4 1 2];

for ip = 1:length(result.avgphv)
	ix = ceil(ip/2);
	iy = ip - 2*(ix-1);
	left = sidegap + (iy-1)*(vgap+width);
	bot = botgap + (ix-1)*(hgap+height);
	subplot('position',[left,bot,width,height]);
	drawlocal;
	setm(gca,'fontsize',8);
	pid = plot_array(ip);
    GV = result.avgphv((pid)).GV_cor;
	surfacem(result.avgphv((pid)).xi,result.avgphv((pid)).yi,GV);
	colormap(seiscmap)
	meanphv = nanmean(GV(:));
	caxis([meanphv*(1-r) meanphv*(1+r)])
	colorbar
    title(['Phase Velocity: ',num2str(result.avgphv((pid)).period),'s  '],'fontsize',10);
end
filename = fullfile('htmls','pics','phaseV_all');
%export_fig(filename,'-png','-m2');
print('-dpng','-r300',filename)

% make rayleigh event num map
figure(88)
clf
set(gcf,'renderer','zbuffer')
set(gcf,'color',[1 1 1]);
set(gcf,'position',[150    50   700   900]);
for ip = 1:length(result.avgphv)
	ix = ceil(ip/2);
	iy = ip - 2*(ix-1);
	left = sidegap + (iy-1)*(vgap+width);
	bot = botgap + (ix-1)*(hgap+height);
	subplot('position',[left,bot,width,height]);
	drawlocal;
	setm(gca,'fontsize',8);
	pid = plot_array(ip);
	surfacem(result.avgphv((pid)).xi,result.avgphv((pid)).yi,result.avgphv(pid).eventnum);
	colormap(seiscmap)
	eventnum = result.avgphv(pid).eventnum;
	eventnum(find(eventnum==0)) = NaN;
	meaneventnum = nanmedian(eventnum(:));
	caxis([0 2*meaneventnum])
	ax = colorbar;
    title(['Eventnum ',num2str(result.avgphv((pid)).period),'s  '],'fontsize',10);
end
filename = fullfile('htmls','pics','eventnum_all');
%export_fig(filename,'-png','-m2');
print('-dpng','-r300',filename)

% Make single frequency plots
for ip = 1:length(result.avgphv)
	figure(88)
	clf
	set(gcf,'renderer','zbuffer')
	set(gcf,'position',[150    50   600   400]);
	set(gcf,'color',[1 1 1]);
	drawlocal;
    GV = result.avgphv((ip)).GV_cor;
	surfacem(result.avgphv((ip)).xi,result.avgphv((ip)).yi,GV);
	colormap(seiscmap)
	meanphv = nanmean(GV(:));
	caxis([meanphv*(1-r) meanphv*(1+r)])
%	caxis([3.6 4])
	ax = colorbar;
	set(get(ax,'ylabel'),'String', ['Phase Velocity ',num2str(result.avgphv((ip)).period),'s (km/s)'],'fontsize',18);
%    ax = title(['Phase Velocity ',num2str(result.avgphv((ip)).period),'s  '],'fontsize',18);
	filename = fullfile('htmls','pics',['phaseV_',num2str(ip)]);
	%export_fig(filename,'-png');
        print('-dpng','-r300',filename)
end


