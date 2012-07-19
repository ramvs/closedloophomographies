function matrix = importXMLtoMATLAB(filename)

xDoc = xmlread(filename);
rows = xDoc.getElementsByTagName('rows').item(0).getFirstChild.getData;
cols = xDoc.getElementsByTagName('cols').item(0).getFirstChild.getData;
data = xDoc.getElementsByTagName('data').item(0).getFirstChild.getData;
datatrim = strtrim(char(data));
datalist = regexp(datatrim, ' +', 'split');
index = 1;

matrix = zeros(rows, cols);

for r = 1:rows
   for c = 1:cols
       matrix(r, c) = datalist(index);
       index = index + 1;
   end
end

disp(matrix)
end