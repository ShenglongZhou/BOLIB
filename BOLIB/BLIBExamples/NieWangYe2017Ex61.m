function w=NieWangYe2017Ex61(x,y,keyf,keyxy)
% This file provides all functions defining NieWangYe2017Ex61 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 5 1]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = y(1)^3*(x(1)^2-3*x(1)*x(2))-y(1)^2*y(2)+y(2)*x(2)^3;
    case 'G'; w = [x-1; -x-1;-y(2)-y(1)*(1-x(1)^2)]; 
    case 'f'; w = y(1)*y(2)^2-y(2)^3-y(1)^2*(x(2)-x(1)^2);  
    case 'g'; w = y'*y-1;   
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [y(1)^3*(2*x(1)-3*x(2)); -3*y(1)^3*x(1)+3*y(2)*x(2)^2];         
        case 'y' ; w = [3*y(1)^2*(x(1)^2-3*x(1)*x(2))-2*y(1)*y(2); -y(1)^2+x(2)^3];        
        case 'xx'; w = [2*y(1)^3 -3*y(1)^3; -3*y(1)^3 6*y(2)*x(2)];
        case 'xy'; w = [3*y(1)^2*(2*x(1)-3*x(2)) -9*y(1)^2*x(1);0  3*x(2)^2];
        case 'yy'; w = [6*y(1)*(x(1)^2-3*x(1)*x(2))-2*y(2) -2*y(1); -2*y(1) 0];
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [eye(2); -eye(2); 2*y(1)*x(1) 0];    
        case 'y' ; w = [zeros(4,2); -(1-x(1)^2) -1];       
        case 'xx'; w = zeros(10,2); w(9,1)=2*y(1);
        case 'xy'; w = zeros(10,2); w(9,1)=2*x(1);
        case 'yy'; w = zeros(10,2); 
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = [2*y(1)^2*x(1);-y(1)^2];    
        case 'y' ; w = [y(2)^2-2*y(1)*(x(2)-x(1)^2); 2*y(1)*y(2)-3*y(2)^2];         
        case 'xx'; w = [2*y(1)^2 0; 0 0];
        case 'xy'; w = [4*y(1)*x(1) -2*y(1); 0 0];
        case 'yy'; w = [-2*(x(2)-x(1)^2) 2*y(2); 2*y(2) 2*y(1)-6*y(2)];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [0 0];
        case 'y' ; w = 2*y';           
        case 'xx'; w = zeros(2,2); 
        case 'xy'; w = zeros(2,2);   
        case 'yy'; w = 2*eye(2);  
        end        
   end   
end
end


