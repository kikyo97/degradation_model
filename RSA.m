%Random Search Algorithm (Pure Random Search Algorithm)
% by : Reza Ahmadzadeh (seyedreza_ahmadzadeh@yahoo.com - reza.ahmadzadeh@iit.it)
% 14-10-2012
% This code finds the minimum of f(x) = x(1)^2 + x(2)^2
% in which -5 < x(i) < 5
% This function is a convex and the minimum is at (0,0)
% The RSA is the simplest algorithm to solve optimization problem
% it is not efficient and it sometimes cannot solve the problem
% for more information start from here: http://en.wikipedia.org/wiki/Random_search
clc
close all
clear all

dim=2;
popsize=100;
ftarget=0.01;
numIter=100;
ObjFun=@(x) sum(x.^2);
for i=1:numIter
    candidate=10*rand(dim,popsize)-5;
    best=min(feval(ObjFun,candidate));
    if best <= ftarget
        break;
    end
end
disp(best);


% just easy, no?! 


