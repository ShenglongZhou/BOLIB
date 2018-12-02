function w=MorganPatrone2006a(x,y,keyf,keyxy)
% This file provides all functions defining MorganPatrone2006a problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 2]

  
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -(x+y);
    case 'G'; w = [-x-0.5;x-0.5];
    case 'f'; w = x*y; 
    case 'g'; w = [-y-1; y-1];  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = -1;         
        case 'y' ; w = -1;    
        case 'xx'; w =  0;
        case 'xy'; w =  0;
        case 'yy'; w =  0;
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-1;1];    
        case 'y' ; w = [ 0;0];        
        case 'xx'; w = [ 0;0];
        case 'xy'; w = [ 0;0];
        case 'yy'; w = [ 0;0];
        end           
	case 'f'    
        switch keyxy
        case 'x' ; w = y;    
        case 'y' ; w = x;         
        case 'xx'; w = 0;
        case 'xy'; w = 1;
        case 'yy'; w = 0;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [ 0; 0];
        case 'y' ; w = [-1; 1];             
        case 'xx'; w = [ 0;0];
        case 'xy'; w = [ 0;0];
        case 'yy'; w = [ 0;0];
        end        
   end   
end
end


