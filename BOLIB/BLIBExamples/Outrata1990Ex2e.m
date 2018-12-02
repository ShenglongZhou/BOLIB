function w=Outrata1990Ex2e(x,y,keyf,keyxy)
% This file provides all functions defining Outrata1990Ex2e problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 1 4]

if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = 0.5*sum((y-[3; 4]).^2);
    case 'G'; w = -x;   
    case 'f'; w = 0.5*(y'*[1+x 0;0 1]*y)-[3+1.333*x x] *y;
    case 'g'; w = [[-0.333+0.1*x 1]*y-x; [1 -0.333-0.1*x]*y-2; -y];   
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
        case 'x' ; w = 0.5*y(1)^2-[1.333 1]*y;    
        case 'y' ; w = [1+x 0;0 1]*y-[3+1.333*x; x];        
        case 'xx'; w = 0;
        case 'xy'; w = [y(1)-1.333; -1];
        case 'yy'; w = [1+x 0;0 1];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [0.1*y(1)-1; -0.1*y(2); 0; 0];
        case 'y' ; w = [-0.333+0.1*x 1; 1 -0.333-0.1*x; -eye(2)];                
        case 'xx'; w = zeros(4,1);
        case 'xy'; w = [0.1 0 0 -0.1 0 0 0 0]';
        case 'yy'; w = zeros(8,2);
        end        
   end   
end
end


