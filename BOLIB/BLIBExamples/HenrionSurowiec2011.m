function w=HenrionSurowiec2011(x,y,keyf,keyxy)
% This file provides all functions defining HenrionSurowiec2011 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 0 0]

 
c = 0;
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x^2+c*y;
    case 'G'; w = []; 
    case 'f'; w = (y/2-x)*y;     
    case 'g'; w = []; 
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*x;         
        case 'y' ; w = c;         
        case 'xx'; w = 2;
        case 'xy'; w = 0;
        case 'yy'; w = 0;
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
        case 'y' ; w =  y-x;          
        case 'xx'; w =  0;
        case 'xy'; w = -1;
        case 'yy'; w =  1;
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


