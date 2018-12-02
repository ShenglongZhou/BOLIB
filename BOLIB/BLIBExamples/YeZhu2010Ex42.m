function w=YeZhu2010Ex42(x,y,keyf,keyxy)
% This file provides all functions defining YeZhu2010Ex42 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 1]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-1)^2+y^2;
    case 'G'; w = [-3-x; x-2];
    case 'f'; w = y^3-3*y; 
    case 'g'; w = x-y;  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*(x-1);         
        case 'y' ; w = 2*y;    
        case 'xx'; w = 2;
        case 'xy'; w = 0;
        case 'yy'; w = 2;
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-1;1];    
        case 'y' ; w = [0;0];        
        case 'xx'; w = [0;0];
        case 'xy'; w = [0;0];
        case 'yy'; w = [0;0];
        end           
	case 'f'    
        switch keyxy
        case 'x' ; w = 0;    
        case 'y' ; w = 3*y^2-3;         
        case 'xx'; w = 0;
        case 'xy'; w = 0;
        case 'yy'; w = 6*y;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = 1;
        case 'y' ; w = -1;             
        case 'xx'; w = 0;
        case 'xy'; w = 0;
        case 'yy'; w = 0;
        end        
   end   
end
end


