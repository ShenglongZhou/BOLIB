function w=GumusFloudas2001Ex5(x,y,keyf,keyxy)
% This file provides all functions defining GumusFloudas2001Ex5 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 2 6]


a = 0.0332333;
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x;
    case 'G'; w = [-x+0.1; x-10];
    case 'f'; w = -y(1)+0.5864*(y(1)^0.67); 
    case 'g'; w = [-y+0.1; y-10; a/y(2)+0.1*y(1)-1;(4*x+2*x^(-0.71))/y(2)+a*x^(-1.3)-1];  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 1;         
        case 'y' ; w = [ 0; 0];       
        case 'xx'; w = 0;
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,2);
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-1; 1];    
        case 'y' ; w = zeros(2,2);         
        case 'xx'; w = zeros(2,1);
        case 'xy'; w = zeros(4,1);
        case 'yy'; w = zeros(4,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 0;    
        case 'y' ; w = [-1+0.392888*y(1)^(-0.33); 0];
        case 'xx'; w = 0;
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = [-0.12965304*y(1)^(-1.33) 0; 0 0];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [zeros(5,1); (4-1.42*x^(-1.71))/y(2)-a*1.3*x^(-2.3)];
        case 'y' ; w = [-eye(2); eye(2); 0.1 -a/(y(2)^2); 0 -(4*x+2*(x^(-0.71)))/(y(2)^2)];            
        case 'xx'; w = [zeros(5,1);  2.4282*x^(-2.71)/y(2)+a*2.99*x^(-3.3)];
        case 'xy'; w = [zeros(11,1); -(4-1.42*x^(-1.71))/(y(2)^2)];
        case 'yy'; w = [zeros(9,2); 0 2*a/(y(2)^3); 0 0; 0 2*(4*x+2*(x^(-0.71)))/(y(2)^3)];
        end        
   end   
end
end
