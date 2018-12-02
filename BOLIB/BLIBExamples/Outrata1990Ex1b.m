function w=Outrata1990Ex1b(x,y,keyf,keyxy)
% This file provides all functions defining Outrata1990Ex1b problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 0 4]

 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x'*x+0.5*sum((y-[3; 4]).^2)-12.5;
    case 'G'; w = [];   
    case 'f'; w = 0.5*(y'*[1 -2; -2 5]*y)-x'*y;
    case 'g'; w = [[-0.333 1]*y-2; [1 -0.333]*y-2; -y];   
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*x;         
        case 'y' ; w = y -[3; 4];     
        case 'xx'; w = 2*eye(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = eye(2);
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
        case 'x' ; w = -y;    
        case 'y' ; w = [1 -2; -2 5]*y-x;        
        case 'xx'; w = zeros(2);
        case 'xy'; w = -eye(2);
        case 'yy'; w = [1 -2; -2 5];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = zeros(4,2);
        case 'y' ; w = [-0.333 1; 1 -0.333; -eye(2)];                
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = zeros(8,2);
        end        
   end   
end
end


