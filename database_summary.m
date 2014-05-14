clear;

setup_parameters;
% read in the dataset and make the summaries
helmholtz_mat = dir(fullfile(gsdfpath,'helmholtz',['*',component,'.mat']));
for ie=1:length(helmholtz_mat)
	eventids(ie) = {helmholtz_mat(ie).name(1:12)};
end

stnms = {};
stanum = 0;
for ie=1:length(eventids)
	disp(eventids(ie));
	matfile = fullfile(gsdfpath,'eikonal',[char(eventids(ie)),'_eikonal_',component,'.mat']);
	load(matfile);
	evlas(ie) = eventphv(1).evla;
	evlos(ie) = eventphv(1).evlo;
	CSnum(ie) = length(eventphv(1).dt);
	seismo_num(ie) = length(eventphv(1).stnms);
	for ista = 1:length(eventphv(1).stnms)
		if ~ismember(eventphv(1).stnms(ista),stnms)
			stanum = stanum+1;
			stlas(stanum) = eventphv(1).stlas(ista);
			stlos(stanum) = eventphv(1).stlos(ista);
			stnms(stanum) = eventphv(1).stnms(ista);
		end
	end
end

save database_sum.mat stlas stlos stnms CSnum evlas evlos eventids seismo_num
