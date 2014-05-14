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
report_maker
result_maker

