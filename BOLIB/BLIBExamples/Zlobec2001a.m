function w=Zlobec2001a(x,y,keyf,keyxy)
% This file provides all functions defining Zlobec2001a problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 0 3]



 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -y(1)/x;
    case 'G'; w = [];
    case 'f'; w = [-1 -1]*y;  
    case 'g'; w = [-1+y(1)+x*y(2); -y];    
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = y(1)/(x^2);         
        case 'y' ; w = [-1/x; 0];    
        case 'xx'; w = -2*y(1)/(x^3);
        case 'xy'; w = [1/(x^2); 0];
        case 'yy'; w = [0 0; 0 0];
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
        case 'y' ; w = [ -1; -1];          
        case 'xx'; w = zeros(1,1);
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [y(2); 0; 0];
        case 'y' ; w = [1 x; -1 0; 0 -1];          
        case 'xx'; w = zeros(3,1);
        case 'xy'; w = zeros(6,1); w(2,1)=1;
        case 'yy'; w = zeros(6,2);
        end        
   end   
end
end


