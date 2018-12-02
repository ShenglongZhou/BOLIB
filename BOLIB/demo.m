clc; close all;
 
% add the path
addpath(genpath(pwd));

% call example to be tested
exname = 'AiyoshiShimizu1984Ex2'; % change the example you want to test here 
fun    = str2func(exname);
x      = randn(2,1); % dimension should be matched
y      = randn(2,1);  
F      = fun(x,y,'F') 
Fx     = fun(x,y,'F','x') 
Gy     = fun(x,y,'G','y') 
fxy    = fun(x,y,'f','xy') 
gyy    = fun(x,y,'g','yy')