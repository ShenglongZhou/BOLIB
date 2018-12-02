function w=CalamaiVicente1994c(x,y,keyf,keyxy)
% This file provides all functions defining CalamaiVicente1994c problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [4 2 0 6]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; [A, B, a]=data();       w = (x'*A*x+y'*B*y)/2+a'*x+2;
    case 'G'; w = [];      
    case 'f'; [~, B, ~, C]=data();    w = x'*C*y+y'*B*y/2; 
    case 'g'; [~,~,~,~,D,E,d]=data(); w = D*x+E*y+d;
    end    
else
    switch keyf
    case 'F'
        [A, B, a]=data();
        switch keyxy
        case 'x' ; w = A*x+a;        
        case 'y' ; w = B*y;       
        case 'xx'; w = A;
        case 'xy'; w = zeros(2,4);
        case 'yy'; w = B;
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [];    
        case 'y' ; w = [];         
        case 'xx'; w = [];
        case 'xy'; w = [];
        case 'yy'; w = [];
        end           
	case 'f'   
        [~, B, ~, C]=data();  
        switch keyxy
        case 'x' ; w = C*y;    
        case 'y' ; w = B*y+ C'*x;         
        case 'xx'; w = zeros(4);
        case 'xy'; w = C';
        case 'yy'; w = B;
        end           
	case 'g' 
        [~,~,~,~,D,E]=data(); 
        switch keyxy
        case 'x' ; w = D;
        case 'y' ; w = E;             
        case 'xx'; w = zeros(24,4);
        case 'xy'; w = zeros(12,4);
        case 'yy'; w = zeros(12,2);
        end        
   end   
end

end
function [A, B, a, C,D,E,d]=data()
A= [197.2  32.4  -129.6 -43.2;
    32.4   110.8 -43.2  -14.4;
   -129.6 -43.2   302.8 -32.4;
   -43.2  -14.4  -32.4   389.2];
B=[100 0; 0 100];
a=[-8.56;-9.52;-9.92;-16.64];
C=[-132.4 -10.8;
   -10.8  -103.6;
    43.2   14.4;
    14.4   4.8];
D=[13.24  1.08  -4.32 -1.44;
   1.08   10.36 -1.44 -0.48;
   13.24  1.08  -4.32 -1.44;
   1.08   10.36 -1.44 -0.48;
  -13.24 -1.08   4.32  1.44;
  -1.08  -10.36  1.44  0.48];
E=[-10 0; 0 -10; 10 0; 0 10; -10 0; 0 -10];
d=[-1; -1; -1.5; -3; 1; 1];
end
