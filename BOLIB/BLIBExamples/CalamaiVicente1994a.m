function w=CalamaiVicente1994a(x,y,keyf,keyxy)
% This file provides all functions defining CalamaiVicente1994a problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 0 3]



rho=1; % rho >= 1

if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-1)^2/2+y^2/2;
    case 'G'; w = [];      
    case 'f'; w = y/2-x*y;     
    case 'g'; w = [x-y-1; -x-y+1; x+y-rho];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = x-1;        
        case 'y' ; w = y;       
        case 'xx'; w = 1;
        case 'xy'; w = 0;
        case 'yy'; w = 1;
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
        switch keyxy
        case 'x' ; w = -y;    
        case 'y' ; w = 1/2-x;         
        case 'xx'; w = 0;
        case 'xy'; w = -1;
        case 'yy'; w = 0;
        end           
	case 'g'    
        switch keyxy
        case 'x' ; w = [1; -1;  1];
        case 'y' ; w = [-1; -1; 1];             
        case 'xx'; w = zeros(3,1);
        case 'xy'; w = zeros(3,1);
        case 'yy'; w = zeros(3,1);
        end        
   end   
end

end
function [A, B, b]=data()
A= [ eye(2);eye(2);-eye(2)];
B= [-eye(2);eye(2);-eye(2)];
b= [-1;-1;-1.5;-3;1;1]; 
end
