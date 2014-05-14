%Main driver to run the web service maintainence.
% written by Ge Jin, jinwar@gmail.com
%

clear;

% make the plot of stacked phase velocity
disp('Making stack plots');
plot_stack_helm;

% make the station and event distribution plots
database_summary;
plot_sta_event_map;

% make the status report
disp('Making status report');
status_maker

% make the catalog
disp('making event files');
%make_year_html(2009);

set(0,'render',default_value);