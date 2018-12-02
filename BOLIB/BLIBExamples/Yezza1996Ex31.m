function w=Yezza1996Ex31(x,y,keyf,keyxy)
% This file provides all functions defining Yezza1996Ex31 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 2]



if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -(4*x-3)*y+2*x+1;
    case 'G'; w = [-x; x-1];
    case 'f'; w = -(1-4*x)*y-2*x-2; 
    case 'g'; w = [-y; y-1]; 
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = -4*y+2;         
        case 'y' ; w = -4*x+3;         
        case 'xx'; w =  0;
        case 'xy'; w = -4;
        case 'yy'; w =  0;
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-1; 1];    
        case 'y' ; w = [ 0; 0];       
        case 'xx'; w = zeros(2,1);
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,1);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 4*y-2;    
        case 'y' ; w = 4*x-1;         
        case 'xx'; w = 0;
        case 'xy'; w = 4;
        case 'yy'; w = 0;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w =  [ 0; 0];   
        case 'y' ; w =  [-1; 1];      
        case 'xx'; w = zeros(2,1);
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,1);
        end        
   end   
end
end


