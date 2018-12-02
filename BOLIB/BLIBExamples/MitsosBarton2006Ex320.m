function w=MitsosBarton2006Ex320(x,y,keyf,keyxy)
% This file provides all functions defining MitsosBarton2006Ex320 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 2]

  
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-0.25)^2+y^2;
    case 'G'; w = [-x-1; x-1]   ;
    case 'f'; w = y^3/3-x^2*y   ;
    case 'g'; w = [-y-1; y-1]   ;
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*(x-0.25);
        case 'y' ; w = 2*y;
        case 'xx'; w = 2;
        case 'xy'; w = 0;
        case 'yy'; w = 2;
        end 
    case 'G' 
        switch keyxy
        case 'x';  w = [-1; 1];
        case 'y';  w = [ 0; 0];
        case 'xx'; w = [ 0; 0];
        case 'xy'; w = [ 0; 0];
        case 'yy'; w = [ 0; 0];
        end           
	case 'f'  
        switch keyxy
        case 'x';  w = -2*x*y;
        case 'y';  w = y^2-x^2;
        case 'xx'; w = -2*y;
        case 'xy'; w = -2*x;
        case 'yy'; w = 2*y;
        end           
	case 'g'; 
        switch keyxy
        case 'x';  w = [ 0; 0];
        case 'y';  w = [-1; 1];
        case 'xx'; w = [ 0; 0];
        case 'xy'; w = [ 0; 0];
        case 'yy'; w = [ 0; 0];
        end        
   end   
end

end