function w=LamparielloSagratella2017Ex23(x,y,keyf,keyxy)
% This file provides all functions defining LamparielloSagratella2017Ex23 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 2 2]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x;
    case 'G'; w = [-1;1]*x-1;
    case 'f'; w = (x-y(1))^2+(y(2)+1)^2; 
    case 'g'; w = [y(1)^3-y(2);-y(2)];  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 1;         
        case 'y' ; w = [0; 0];    
        case 'xx'; w = 0;
        case 'xy'; w = [0;0];
        case 'yy'; w = zeros(2);
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-1;1];    
        case 'y' ; w = zeros(2,2);       
        case 'xx'; w = zeros(2,1); 
        case 'xy'; w = zeros(4,1); 
        case 'yy'; w = zeros(4,2); 
        end           
	case 'f'  
        switch keyxy  
        case 'x' ; w = 2*(x-y(1));    
        case 'y' ; w = 2*(y-[x;-1]);         
        case 'xx'; w = 2;
        case 'xy'; w = 2*[-1;0];
        case 'yy'; w = 2*eye(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [0; 0];    
        case 'y' ; w = [3*y(1)^2 -1; 0 -1];        
        case 'xx'; w = zeros(2,1);
        case 'xy'; w = zeros(4,1);
        case 'yy'; w = [6*y(1) 0; zeros(3,2) ];
        end        
   end   
end
end


