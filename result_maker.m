% script to make the html file to report the database status

clear;

if ~exist('htmls','dir')
	mkdir('htmls')
end

setup_parameters;
htmlname = 'htmls/result_summary.html';

fp = fopen(htmlname,'w');
fprintf(fp,'<html>\n');
fprintf(fp,'<body>\n');

% Header
fprintf(fp,'<h1><font size = 5>Result Summary</font></h1>\n');
fprintf(fp,'<p>\n');
fprintf(fp,'Update Time: %s\n',datestr(now));
fprintf(fp,'</p>\n');

% Rayleigh
fprintf(fp,'<p>\n');
fprintf(fp,'Summary map: <br>\n');
fprintf(fp,'<img src="pics/phaseV_all.png" alt="Result Map" width="500"><br>\n');
fprintf(fp,'Single period maps: <br>\n');
for ip = 1:length(periods)
fprintf(fp,'<img src="pics/phaseV_%d.png" alt="Result Map" width="400"><br>\n',ip);
fprintf(fp,'</p>\n');
end

fprintf(fp,'</body>\n');
fprintf(fp,'</html>\n');

fclose(fp);
