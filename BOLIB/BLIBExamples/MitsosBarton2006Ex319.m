function w=MitsosBarton2006Ex319(x,y,keyf,keyxy)
% This file provides all functions defining MitsosBarton2006Ex319 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 2]

 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-1+y/2)*y;
    case 'G'; w = [-x-1; x-1]; 
    case 'f'; w = (-x+y^2/2)*y^2;  
    case 'g'; w = [-y-1; y-1];    
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = y;         
        case 'y' ; w = x-1+y;          
        case 'xx'; w = 0;
        case 'xy'; w = 1;
        case 'yy'; w = 1;
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
        case 'x' ; w = -y^2;    
        case 'y' ; w = -2*y*(x-y^2);         
        case 'xx'; w = 0;
        case 'xy'; w = -2*y;
        case 'yy'; w = -2*x+6*y^2;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [ 0; 0];
        case 'y' ; w = [-1; 1];            
        case 'xx'; w = zeros(2,1);  
        case 'xy'; w = zeros(2,1);   
        case 'yy'; w = zeros(2,1);
        end        
   end   
end
end


