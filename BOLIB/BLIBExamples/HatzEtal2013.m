function w=HatzEtal2013(x,y,keyf,keyxy)
% This file provides all functions defining HatzEtal2013 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 0 2]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -x+2*y(1)+y(2);
    case 'G'; w = [];  
    case 'f'; w = (x-y(1))^2+y(2)^2;     
    case 'g'; w = -y; 
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = -1;         
        case 'y' ; w = [2; 1];         
        case 'xx'; w = 0;
        case 'xy'; w = [  0;   0];
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
        case 'x' ; w =  2*(x-y(1));    
        case 'y' ; w = [2*(y(1)-x); 2*y(2)];          
        case 'xx'; w =  2;
        case 'xy'; w = [-2;   0];
        case 'yy'; w = [2 0; 0 2];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [   0;    0];
        case 'y' ; w = [-1 0; 0 -1];             
        case 'xx'; w = zeros(2,1);
        case 'xy'; w = zeros(4,1);
        case 'yy'; w = zeros(4,2);
        end        
   end   
end

end


