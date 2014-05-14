clear;

setup_parameters;
% read in the dataset and make the summaries

eikonal_files = dir(fullfile(gsdfpath,'eikonal',['*',component,'.mat']));
stnms = {};
stanum = 0;
for ie=1:length(eikonal_files)
	disp(eikonal_files(ie).name);
	matfile = fullfile(gsdfpath,'eikonal',eikonal_files(ie).name);
	load(matfile);
	evlas(ie) = eventphv(1).evla;
	evlos(ie) = eventphv(1).evlo;
	CSnum(ie) = length(eventphv(1).dt);
	eventids(ie) = {eventphv(1).id};
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
