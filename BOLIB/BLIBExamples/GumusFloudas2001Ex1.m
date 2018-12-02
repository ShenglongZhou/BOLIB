function w=GumusFloudas2001Ex1(x,y,keyf,keyxy)
% This file provides all functions defining GumusFloudas2001Ex1 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 3 3]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = 16*x^2+9*y^2;
    case 'G'; w = [-x; x-12.5; -4*x+y];
    case 'f'; w = (x+y-20)^4; 
    case 'g'; w = [-y; y-50; 4*x+y-50];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 32*x;         
        case 'y' ; w = 18*y;     
        case 'xx'; w = 32;
        case 'xy'; w = 0;
        case 'yy'; w = 18;
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-1;1;-4];    
        case 'y' ; w = [ 0;0; 1];          
        case 'xx'; w = zeros(3,1);
        case 'xy'; w = zeros(3,1);
        case 'yy'; w = zeros(3,1);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 4*(x+y-20)^3;    
        case 'y' ; w = 4*(x+y-20)^3;          
        case 'xx'; w = 12*(x+y-20)^2;
        case 'xy'; w = 12*(x+y-20)^2;
        case 'yy'; w = 12*(x+y-20)^2;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [0; 0; 4];
        case 'y' ; w = [-1;1; 1];             
        case 'xx'; w = zeros(3,1);
        case 'xy'; w = zeros(3,1);
        case 'yy'; w = zeros(3,1);
        end        
   end   
end
end


