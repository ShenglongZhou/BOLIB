function w=LamparielloSagratella2017Ex33(x,y,keyf,keyxy)
% This file provides all functions defining LamparielloSagratella17Ex33 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 1 3]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x^2+(sum(y))^2;
    case 'G'; w = .5-x;
    case 'f'; w = y(1); 
    case 'g'; w = [1-x-sum(y);-y];  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*x;         
        case 'y' ; w = 2*sum(y)*[1;1];    
        case 'xx'; w = 2;
        case 'xy'; w = [0;0];
        case 'yy'; w = 2*ones(2,2);
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
        case 'x' ; w = 0;    
        case 'y' ; w = [1;0];         
        case 'xx'; w = 0;
        case 'xy'; w = [0;0];
        case 'yy'; w = zeros(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [-1;0;0];    
        case 'y' ; w = [-1 -1; -eye(2)];        
        case 'xx'; w = zeros(3,1);
        case 'xy'; w = zeros(6,1);
        case 'yy'; w = zeros(6,2);
        end        
   end   
end
end


