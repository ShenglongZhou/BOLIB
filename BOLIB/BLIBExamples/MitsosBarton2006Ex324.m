function w=MitsosBarton2006Ex324(x,y,keyf,keyxy)
% This file provides all functions defining MitsosBarton2006Ex324 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 2]

  
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x^2-y;
    case 'G'; w = [-x; x-1]   ;
    case 'f'; w = ((y-1-0.1*x)^2-0.5-0.5*x)^2;
    case 'g'; w = [-y; y-3]   ;
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*x;
        case 'y' ; w = -1;
        case 'xx'; w = 2;
        case 'xy'; w = 0;
        case 'yy'; w = 0;
        end 
    case 'G'; 
        switch keyxy
        case 'x';  w = [-1; 1];
        case 'y';  w = [ 0; 0];
        case 'xx'; w = [ 0; 0];
        case 'xy'; w = [ 0; 0];
        case 'yy'; w = [ 0; 0];
        end           
	case 'f';  
        xy=y-1-0.1*x;
        switch keyxy
        case 'x';  w = 2*(xy^2-0.5-0.5*x)*(-0.2*xy-0.5);
        case 'y';  w = 4*(xy^2-0.5-0.5*x)*xy;
        case 'xx'; w = 2*(-0.2*xy-0.5)^2+0.04*(xy^2-0.5-0.5*x); 
        case 'xy'; w = 4*xy*(-0.2*xy-0.5)-0.4*(xy^2-0.5-0.5*x);
        case 'yy'; w = 8*xy^2+4*(xy^2-0.5-0.5*x); 
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