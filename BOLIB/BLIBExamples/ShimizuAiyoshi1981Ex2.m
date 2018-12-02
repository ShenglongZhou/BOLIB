function w=ShimizuAiyoshi1981Ex2(x,y,keyf,keyxy)
% This file provides all functions defining ShimizuAiyoshi1981Ex2 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 3 4]

 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = sum((x-[30;20]).^2)+[-20 20]*y;
    case 'G'; w = [-[1 2]*x+30; [1 1]*x-25; [0 1]*x-15];    
    case 'f'; w = sum((x-y).^2);  
    case 'g'; w = [ y-10; -y];    
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*(x-[30;20]);         
        case 'y' ; w = [-20; 20];    
        case 'xx'; w = 2*eye(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = zeros(2);
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-1 -2; 1 1; 0 1];    
        case 'y' ; w = [0 0; 0 0; 0 0];         
        case 'xx'; w = zeros(6,2);
        case 'xy'; w = zeros(6,2);
        case 'yy'; w = zeros(6,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 2*(x-y);    
        case 'y' ; w = 2*(y-x);        
        case 'xx'; w = 2*eye(2);
        case 'xy'; w = -2*eye(2);
        case 'yy'; w = 2*eye(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = zeros(4,2);
        case 'y' ; w = [eye(2);-eye(2)];          
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = zeros(8,2);
        end        
   end   
end
end


