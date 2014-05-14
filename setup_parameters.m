
% define the location of the gsdf working path
gsdfpath = fullfile('..','matgsdf');

run(fullfile(gsdfpath,'setup_parameters.m'));

lalim = parameters.lalim;
lolim = parameters.lolim;
component = parameters.component;
periods = parameters.periods;


