function w=GumusFloudas2001Ex4(x,y,keyf,keyxy)
% This file provides all functions defining GumusFloudas2001Ex4 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 5 2]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-3)^2+(y-2)^2;
    case 'G'; w = [-x; x-8; -2*x+y-1; x-2*y+2; x+2*y-14];
    case 'f'; w = (y-5)^2; 
    case 'g'; w = [-y; y-10];
    end    
else
    switch keyf
    case 'F'  
        switch keyxy
        case 'x' ; w = 2*(x-3);         
        case 'y' ; w = 2*(y-2);
        case 'xx'; w = 2;
        case 'xy'; w = 0;
        case 'yy'; w = 2;
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-1;1;-2;1;1];    
        case 'y' ; w = [0;0;1;-2;2];          
        case 'xx'; w = zeros(5,1);
        case 'xy'; w = zeros(5,1);
        case 'yy'; w = zeros(5,1);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 0;    
        case 'y' ; w = 2*(y-5);          
        case 'xx'; w = 0;
        case 'xy'; w = 0;
        case 'yy'; w = 2;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [0; 0];
        case 'y' ; w = [-1; 1];             
        case 'xx'; w = zeros(2,1);
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,1);
        end        
   end   
end
end


