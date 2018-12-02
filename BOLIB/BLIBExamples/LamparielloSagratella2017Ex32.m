function w=LamparielloSagratella2017Ex32(x,y,keyf,keyxy)
% This file provides all functions defining LamparielloSagratella17Ex32 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 0 0]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x^2+y^2;
    case 'G'; w = [];
    case 'f'; w = (x+y-1)^2; 
    case 'g'; w = [];  
    end    
else
    switch keyf
    case 'F'  
        switch keyxy
        case 'x' ; w = 2*x;         
        case 'y' ; w = 2*y;    
        case 'xx'; w = 2;
        case 'xy'; w = 0;
        case 'yy'; w = 2;
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
        case 'x' ; w = 2*(x+y-1);    
        case 'y' ; w = 2*(x+y-1);         
        case 'xx'; w = 2;
        case 'xy'; w = 2;
        case 'yy'; w = 2;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [];    
        case 'y' ; w = [];        
        case 'xx'; w = [];
        case 'xy'; w = [];
        case 'yy'; w = [];
        end        
   end   
end
end


