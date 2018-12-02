function w=MitsosBarton2006Ex310(x,y,keyf,keyxy)
% This file provides all functions defining MitsosBarton2006Ex310 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 2]


 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = y;
    case 'G'; w = [-x+0.1; x-1]; 
    case 'f'; w = x*(16*y^4+2*y^3-8*y^2-1.5*y+0.5);
    case 'g'; w = [-y-1; y-1];    
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 0;         
        case 'y' ; w = 1;     
        case 'xx'; w = 0;
        case 'xy'; w = 0;
        case 'yy'; w = 0;
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
        case 'x' ; w = 16*y^4+2*y^3-8*y^2-1.5*y+0.5;    
        case 'y' ; w = x*(64*y^3+6*y^2-16*y-1.5);       
        case 'xx'; w = 0;
        case 'xy'; w = 64*y^3+6*y^2-16*y-1.5;
        case 'yy'; w = x*(192*y^2+12*y-16);
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


