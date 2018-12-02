function w=MitsosBarton2006Ex321(x,y,keyf,keyxy)
% This file provides all functions defining MitsosBarton2006Ex321 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 2]

  
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x+0.6)^2+y^2;
    case 'G'; w = [-x-1; x-1]   ;
    case 'f'; w = y^4+(4/30)*(1-x)*y^3+(-0.02*x^2+0.16*x-0.4)*y^2+(0.004*x^3-0.036*x^2+0.08*x)*y;
    case 'g'; w = [-y-1; y-1]   ;
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*(x+0.6);
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
        case 'x';  w = -(4/30)*y^3+(-0.04*x+0.16)*y^2+(0.012*x^2-0.072*x+0.08)*y;
        case 'y';  w = 4*y^3+(4/10)*(1-x)*y^2+2*(-0.02*x^2+0.16*x-0.4)*y+(0.004*x^3-0.036*x^2+0.08*x);
        case 'xx'; w = -0.04*y^2+(0.024*x-0.072)*y;
        case 'xy'; w = -(4/10)*y^2+2*(-0.04*x+0.16)*y+(0.012*x^2-0.072*x+0.08);
        case 'yy'; w = 12*y^2+(4/5)*(1-x)*y+2*(-0.02*x^2+0.16*x-0.4);
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