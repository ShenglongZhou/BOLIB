function w=MitsosBarton2006Ex323(x,y,keyf,keyxy)
% This file provides all functions defining MitsosBarton2006Ex323 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 3 3]

 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x^2;
    case 'G'; w = [-x-1; x-1; 1+x-9*x^2-y];
    case 'f'; w = y;
    case 'g'; w = [-y-1; y-1; y^2*(x-0.5)];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*x;
        case 'y' ; w = 0;
        case 'xx'; w = 2;
        case 'xy'; w = 0;
        case 'yy'; w = 0;
        end 
    case 'G'; 
        switch keyxy
        case 'x';  w = [-1; 1; 1-18*x];
        case 'y';  w = [ 0; 0; -1];
        case 'xx'; w = [ 0; 0; -18];
        case 'xy'; w = [ 0; 0; 0];
        case 'yy'; w = [ 0; 0; 0];
        end           
	case 'f';  
        switch keyxy
        case 'x';  w = 0;
        case 'y';  w = 1;
        case 'xx'; w = 0;
        case 'xy'; w = 0;
        case 'yy'; w = 0;
        end           
	case 'g';  
        switch keyxy
        case 'x';  w = [0; 0;y^2];
        case 'y';  w = [-1; 1; 2*y*(x-0.5)];
        case 'xx'; w = [ 0; 0; 0];
        case 'xy'; w = [ 0; 0; 2*y];
        case 'yy'; w = [ 0; 0; 2*(x-0.5) ];
        end        
   end   
end

end