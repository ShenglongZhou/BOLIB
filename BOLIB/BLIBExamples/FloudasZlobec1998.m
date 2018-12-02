function w=FloudasZlobec1998(x,y,keyf,keyxy)
% This file provides all functions defining FloudasZlobec1998 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 2 6]



if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = [x^3 1]*y;
    case 'G'; w = [-x; x-1];
    case 'f'; w = -y(2); 
    case 'g'; w = [-y-[1;0]; y-[1; 100]; x*y(1)-10; y(1)^2+x*y(2)-1];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 3*x^2*y(1);         
        case 'y' ; w = [x^3; 1];     
        case 'xx'; w = 6*x*y(1);
        case 'xy'; w = [3*x^2; 0];
        case 'yy'; w = zeros(2,2);
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [ -1;   1];    
        case 'y' ; w = [0 0; 0 0];          
        case 'xx'; w = zeros(2,1);
        case 'xy'; w = zeros(4,1);
        case 'yy'; w = zeros(4,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 0;    
        case 'y' ; w = [0; -1];          
        case 'xx'; w = zeros(1,1);
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [0; 0; 0; 0; y(1); y(2)];
        case 'y' ; w = [-eye(2); eye(2); x 0; 2*y(1) x];             
        case 'xx'; w = zeros(6,1);
        case 'xy'; w = [zeros(8,1); 1; 0; 0; 1];
        case 'yy'; w = [zeros(10,2); 2 0; 0  0];
        end        
   end   
end
end


