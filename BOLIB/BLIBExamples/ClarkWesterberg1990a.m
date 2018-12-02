function w=ClarkWesterberg1990a(x,y,keyf,keyxy)
% This file provides all functions defining ClarkWesterberg1990a problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 3]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-3)^2+(y-2)^2;
    case 'G'; w = [x-8; -x];      
    case 'f'; w = (y-5)^2;     
    case 'g'; w = [-2*x+y-1; x-2*y-2; x+2*y-14];
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
        case 'x' ; w = [1; -1];    
        case 'y' ; w = [0;  0];         
        case 'xx'; w = [0;0];
        case 'xy'; w = [0;0];
        case 'yy'; w = [0;0];
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
        case 'x' ; w = [-2;  1;  1];
        case 'y' ; w = [ 1; -2;  2];             
        case 'xx'; w = zeros(3,1);
        case 'xy'; w = zeros(3,1);
        case 'yy'; w = zeros(3,1);
        end        
   end   
end

end




