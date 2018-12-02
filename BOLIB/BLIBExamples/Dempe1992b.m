function w=Dempe1992b(x,y,keyf,keyxy)
% This file provides all functions defining Dempe1992b problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 0 1]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-3.5)^2+(y+4)^2;
    case 'G'; w = []; 
    case 'f'; w = (y-3)^2;      
    case 'g'; w = y^2-x;  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*(x-3.5);         
        case 'y' ; w = 2*(y+4);        
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
        case 'x' ; w = 0;    
        case 'y' ; w = 2*(y-3);         
        case 'xx'; w = 0;
        case 'xy'; w = 0;
        case 'yy'; w = 2;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = -1;
        case 'y' ; w = 2*y;                
        case 'xx'; w = 0;
        case 'xy'; w = 0;
        case 'yy'; w = 2;
        end        
   end   
end

end



