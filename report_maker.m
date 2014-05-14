% script to make the html file to report the database status

clear;

if ~exist('htmls','dir')
	mkdir('htmls')
end

setup_parameters;
htmlname = 'htmls/data_summary.html';

fp = fopen(htmlname,'w');
fprintf(fp,'<html>\n');
fprintf(fp,'<body>\n');

% Header
fprintf(fp,'<h1><font size = 5>Database Status Report</font></h1>\n');
fprintf(fp,'<p>\n');
fprintf(fp,'Update Time: %s\n',datestr(now));
fprintf(fp,'</p>\n');

% Rayleigh
fprintf(fp,'<h2><font size = 4>Database Summary</font></h2>\n');
helm_files = dir(fullfile(gsdfpath,'eikonal','*LHZ.mat'));
fprintf(fp,'<p>\n');
fprintf(fp,'Event Processed: %d<br>\n',length(helm_files));
fprintf(fp,'Earliest Event: %s<br>\n',helm_files(1).name(1:12));
fprintf(fp,'Lastest Event: %s<br>\n',helm_files(end).name(1:12));
fprintf(fp,'Stacked good event number map: <br>\n');
fprintf(fp,'<img src="pics/eventnum_all.png" alt="Event Number Map" width="500"><br>\n',length(helm_files));
fprintf(fp,'Station map: <br>\n');
fprintf(fp,'<img src="pics/station_map.png" alt="Station Map" width="500"><br>\n',length(helm_files));
fprintf(fp,'Event map: <br>\n');
fprintf(fp,'<img src="pics/event_map.png" alt="Event Map" width="500"><br>\n',length(helm_files));
fprintf(fp,'Event azimuthal distribution: <br>\n');
fprintf(fp,'<img src="pics/event_azi.png" alt="Event Map" width="300"><br>\n',length(helm_files));
fprintf(fp,'</p>\n');

% Love
%fprintf(fp,'<h2><font size = 4>Love Status Report</font></h2>\n');
%helm_files = dir('../LHT/helmholtz/*LHT.mat');
%fprintf(fp,'<p>\n');
%fprintf(fp,'Event Processed: %d<br>\n',length(helm_files));
%fprintf(fp,'Earliest Event: %s<br>\n',helm_files(1).name(1:12));
%fprintf(fp,'Lastest Event: %s<br>\n',helm_files(end).name(1:12));
%fprintf(fp,'Stacked good event number map: <br>\n');
%fprintf(fp,'<img src="report_files/love_eventnummap.jpg" alt="Love Event Number Map" width="500"><br>\n',length(helm_files));
%fprintf(fp,'</p>\n');
%
%fprintf(fp,'<p>\n');
%fprintf(fp,'<a href="http://www.ldeo.columbia.edu/~ge.jin/projects/USarray.html">Back to Ge Jin''s Homepage</a>\n');
%fprintf(fp,'</p>\n');

fprintf(fp,'</body>\n');
fprintf(fp,'</html>\n');

fclose(fp);
