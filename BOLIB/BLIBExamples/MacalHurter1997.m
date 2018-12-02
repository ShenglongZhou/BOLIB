function w=MacalHurter1997(x,y,keyf,keyxy)
% This file provides all functions defining MacalHurter1997 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 0 0]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-1)^2+(y-1)^2;
    case 'G'; w = []; 
    case 'f'; w = 0.5*y^2+500*y-50*x*y;
    case 'g'; w = [];    
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*(x-1);         
        case 'y' ; w = 2*(y-1);     
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
        case 'x' ; w = -50*y;    
        case 'y' ; w = y+500-50*x;       
        case 'xx'; w = 0;
        case 'xy'; w = -50;
        case 'yy'; w = 1;
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


