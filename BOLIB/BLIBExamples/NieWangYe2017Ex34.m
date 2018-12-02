function w=NieWangYe2017Ex34(x,y,keyf,keyxy)
% This file provides all functions defining NieWangYe2017Ex34 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 2 2]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x+sum(y);
    case 'G'; w = [-x+2; x-3]; 
    case 'f'; w = x*sum(y);  
    case 'g'; w = [-y(1)^2+y(2)^2+(y(1)^2+y(2)^2)^2; -y(1)];   
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 1;         
        case 'y' ; w = [1; 1];        
        case 'xx'; w = 0;
        case 'xy'; w = [0;0];
        case 'yy'; w = [0 0;0 0];
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
        case 'x' ; w = sum(y);    
        case 'y' ; w = [x;x];         
        case 'xx'; w = 0;
        case 'xy'; w = [1;1];
        case 'yy'; w = zeros(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [0;0];
        case 'y' ; w = [-2*y(1)+4*(y(1)^3+y(1)*y(2)^2) 2*y(2)+4*(y(2)^3+y(2)*y(1)^2); -1 0];           
        case 'xx'; w =  zeros(2,1); 
        case 'xy'; w =  zeros(4,1);   
        case 'yy'; w = [-2+4*(3*y(1)^2+y(2)^2) 8*y(2)*y(1); 
                        8*y(2)*y(1) 2+4*(3*y(2)^2+y(1)^2);0 0;0 0];  
        end        
   end   
end
end


