function [x,fmn]=ossrs(x)
%OSSRS: Optimized Step Size Random Search
% Author of method and code: Sheela V. Belur(sbelur@csc.com)
% Reference: computer Methods in Applied Mechanics & Engg, Vol  19, 99-106 , 1979
%
% function [x,fmn]=ossrs(x)
%
% n is the number of decision variables.
% x is the starting values and returns the optimal values
% fmn is the optimal function value 
n=2;
nx=3;f(1)=fun(x);
disp('Initial Function Value and Decision Variables')
fmn=f(1)
x
eps=1.0e-09;nor=0;std=0.05;
nor=0;fmn0=fmn;
while( nor<100)
for i=1:n
   r(i)=randn*std;
end
an2=x-r;
an3=x+r;
f(2)=fun(an2);nor=nor+1;
f(3)=fun(an3);nor=nor+1;
a=f(2)-2.0*f(1)+f(3);
if(a>0.0)

  amda=-0.5*(f(3)-f(2))/a;nx=4;
  an4=x+amda*r;
  f(4)=fun(an4);
  nor=nor+1;
end

[fmn,mn]=min(f)
if(mn==2)x=an2;
elseif(mn==3)x=an3;
elseif(mn==4)x=an4;end
f(1)=fmn;
diff=abs(fmn-fmn0);
if(diff==0.0)nor=nor+1;
else 
  nor=0;fmn0=fmn
end
nor,fmn,x
end

function f=fun(x)

% objective function evaluation

f=(x(1)-5.0)^2+(x(2)+8)^2;



  