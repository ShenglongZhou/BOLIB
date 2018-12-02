function w=Outrata1993Ex31(x,y,keyf,keyxy)
% This file provides all functions defining Outrata1993Ex31 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 1 4]


 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = 0.5*sum((y-[3; 4]).^2);
    case 'G'; w = -x;   
    case 'f'; w = 0.5*(1+0.2*x)*y(1)^2+0.5*(1+0.1*x)*y(2)^2-[3+1.333*x x]*y; 
    case 'g'; w = [[-0.333+0.1*x 1]*y+0.1*x-2; [ 1 -0.333-0.1*x]*y+0.1*x-2; -y];   
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 0;         
        case 'y' ; w = y-[3; 4];     
        case 'xx'; w = 0;
        case 'xy'; w = [   0;   0 ];
        case 'yy'; w = [ 1 0; 0 1 ];
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = -1;    
        case 'y' ; w = [0 0];          
        case 'xx'; w = zeros(1,1);
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 0.1*y(1)^2+0.05*y(2)^2-[1.333 1]*y;    
        case 'y' ; w = [(1+0.2*x)*y(1)-(3+1.333*x); (1+0.1*x)*y(2)-x];        
        case 'xx'; w = 0;
        case 'xy'; w = [ 0.2*y(1)-1.333; 0.1*y(2)-1];
        case 'yy'; w = [ 1+0.2*x 0; 0  1+0.1*x];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [0.1*y(1)+0.1; -0.1*y(2)+0.1; 0;0];
        case 'y' ; w = [-0.333+0.1*x 1; 1 -0.333-0.1*x; -1 0; 0 -1];                
        case 'xx'; w = zeros(4,1);
        case 'xy'; w = [0.1 0 0 -0.1 0 0 0 0]';
        case 'yy'; w = zeros(8,2);
        end        
   end   
end
end


