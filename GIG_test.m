filename = "jumpsizedata.txt";
delimiterIn = "\t";
A = importdata(filename,delimiterIn);

function [m,s] = eee(x)
n = length(x);
m = sum(x)/n;
s = sqrt(sum((x-m).^2/n));
end