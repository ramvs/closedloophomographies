function runtest 
    [h01, h12, h23, h34, h45, h56] = loadMatFromOpenCVXML('test_set_9/homografia', 1, 6);
    h16 = importXMLtoMATLAB('testset9test2/homografia_new0006.xml');
    h12vec = reshape(h12', 9, 1);
    h23vec = reshape(h23', 9, 1);
    h34vec = reshape(h34', 9, 1);
    h45vec = reshape(h45', 9, 1);
    h56vec = reshape(h56', 9, 1);
    %intial estimate
    x0 = [h12vec(1:8); h23vec(1:8); h34vec(1:8); h45vec(1:8); h56vec(1:8)]
end