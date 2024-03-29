%prompt for and read data
fprintf(['Please input data to be fitted. Data should be formatted in two\n'...
    'columns, with the independent variable in the left column. The\n'...
    'columns must be tab-delimited.\n\n']);
filename = uigetfile( ...
    {'*.txt;*.dat;*.text', 'Data Files (*.txt,*.dat,*.text)';
	'*.*', 'All Files (*.*)'}, ...
	'Select data file');
fid = fopen(filename);
if fid < 0
    error('Can''t open file for reading.');
end
data = fscanf(fid, '%g %g', [2 inf])';
fclose(fid);
%prompt for fitting equation, parameters, and ranges
inputequation = input(['Please input fitting equation, with x as the '...
    'independent variable\n(make multiplication explicit):\n'], 's');
parameters = input('\nPlease input fitting parameters, separated by commas (include x)\n', 's');
equation = str2func([strcat('@(',parameters,') ') vectorize(char(inputequation))]);
tempparameter = textscan(parameters,'%s','delimiter',',')
parameter = cell2mat(tempparameter(1,1))
parameter(1).size()
%parameter{1}.size()
%
%for i=0:parameter.size()
%end
%equation(3,9,2)
%initialize search parameters and calculate MSRE
%perturb parameters and find minima
%print global minimum