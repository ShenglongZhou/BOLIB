function w=Outrata1990Ex2a(x,y,keyf,keyxy)
% This file provides all functions defining Outrata1990Ex2a problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 1 4]

 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = 0.5*sum((y-[3; 4]).^2);
    case 'G'; w = -x;   
    case 'f'; w = 0.5*(y'*y)-[3+1.333*x x] *y;
    case 'g'; w = [[-0.333 1]*y-2; [1 -0.333]*y-2; -y];   
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 0;         
        case 'y' ; w = y -[3; 4];     
        case 'xx'; w = 0;
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = eye(2);
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = -1;    
        case 'y' ; w = zeros(1,2);         
        case 'xx'; w = 0;
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = -[1.333 1]*y;    
        case 'y' ; w = y-[3+1.333*x; x];        
        case 'xx'; w = 0;
        case 'xy'; w = -[1.333; 1];
        case 'yy'; w = eye(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = zeros(4,1);
        case 'y' ; w = [-0.333 1; 1 -0.333; -eye(2)];                
        case 'xx'; w = zeros(4,1);
        case 'xy'; w = zeros(8,1);
        case 'yy'; w = zeros(8,2);
        end        
   end   
end
end


