function w=Zlobec2001b(x,y,keyf,keyxy)
% This file provides all functions defining Zlobec2001b problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 4]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x+y;
    case 'G'; w = [-x;x-1];
    case 'f'; w = -y;  
    case 'g'; w = [ -y; y-1; -x*y; x*y];    
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 1;         
        case 'y' ; w = 1;    
        case 'xx'; w = 0;
        case 'xy'; w = 0;
        case 'yy'; w = 0;
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
        case 'y' ; w = -1;          
        case 'xx'; w = 0;
        case 'xy'; w = 0;
        case 'yy'; w = 0;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [ 0; 0; -y; y];
        case 'y' ; w = [-1; 1; -x; x];          
        case 'xx'; w = zeros(4,1);
        case 'xy'; w = [0;0;-1;1];
        case 'yy'; w = zeros(4,1);
        end        
   end   
end
end


