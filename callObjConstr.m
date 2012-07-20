function [x fval] = callObjConstr(x0, options)

if nargin < 2
    options = optimset('Algorithm', 'sqp');
end

[x fval] = fmincon(@objectiveh16istruth, x0, [], [], [], [], [], [], @nonlinearconst, options);

function f = objectiveh16istruth(xin)
h16 = importXMLtoMATLAB('testset9test2/homografia_new0006.xml');
x12 = [xin(1), xin(2), xin(3); xin(4), xin(5), xin(6); xin(7), xin(8), 1];
x23 = [xin(9), xin(10), xin(11); xin(12), xin(13), xin(14); xin(15), xin(16), 1];
x34 = [xin(17), xin(18), xin(19); xin(20), xin(21), xin(22); xin(23), xin(24), 1];
x45 = [xin(25), xin(26), xin(27); xin(28), xin(29), xin(30); xin(31), xin(32), 1];
x56 = [xin(33), xin(34), xin(35); xin(36), xin(37), xin(38); xin(39), xin(40), 1];
xcum = x12*x23*x34*x34*x45*x56;
f = abs(xcum(1, 1) - h16(1, 1)) + abs(xcum(1, 2) - h16(1, 2)) + ...
    abs(xcum(1, 3) - h16(1, 3)) + abs(xcum(2, 1) - h16(2, 1)) + ...
    abs(xcum(2, 2) - h16(2, 2)) + abs(xcum(2, 3) - h16(2, 3)) + ...
    abs(xcum(3, 1) - h16(3, 1)) + abs(xcum(3, 2) - h16(3, 2)) + ...
    abs(xcum(3, 3) - h16(3, 3)); 

function [c, ceq] = nonlinearconst(x)
detthresh = 0.15;
x12 = [x(1), x(2), x(3); x(4), x(5), x(6); x(7), x(8), 1];
x23 = [x(9), x(10), x(11); x(12), x(13), x(14); x(15), x(16), 1];
x34 = [x(17), x(18), x(19); x(20), x(21), x(22); x(23), x(24), 1];
x45 = [x(25), x(26), x(27); x(28), x(29), x(30); x(31), x(32), 1];
x56 = [x(33), x(34), x(35); x(36), x(37), x(38); x(39), x(40), 1];
ceq = [];
c(1) = abs(det(x12) - 1) - detthresh;
c(2) = abs(det(x23) - 1) - detthresh;
c(3) = abs(det(x34) - 1) - detthresh;
c(4) = abs(det(x45) - 1) - detthresh;
c(5) = abs(det(x56) - 1) - detthresh;