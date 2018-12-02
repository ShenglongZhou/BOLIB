function w=ShimizuAiyoshi1981Ex1(x,y,keyf,keyxy)
% This file provides all functions defining ShimizuAiyoshi1981Ex1 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 3 3]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x^2+(y-10)^2;
    case 'G'; w = [x-15; -x+y; -x];    
    case 'f'; w = (x+2*y-30)^2;  
    case 'g'; w = [x+y-20; y-20; -y];    
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*x;         
        case 'y' ; w = 2*(y-10);    
        case 'xx'; w = 2;
        case 'xy'; w = 0;
        case 'yy'; w = 2;
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [1; -1; -1];    
        case 'y' ; w = [0;  1;  0];         
        case 'xx'; w = zeros(3,1);
        case 'xy'; w = zeros(3,1);
        case 'yy'; w = zeros(3,1);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 2*(x+2*y-30);    
        case 'y' ; w = 4*(x+2*y-30);        
        case 'xx'; w = 2;
        case 'xy'; w = 4;
        case 'yy'; w = 8;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [1; 0;  0];
        case 'y' ; w = [1; 1; -1];          
        case 'xx'; w = zeros(3,1);
        case 'xy'; w = zeros(3,1);
        case 'yy'; w = zeros(3,1);
        end        
   end   
end
end


