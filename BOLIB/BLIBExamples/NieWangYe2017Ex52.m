function w=NieWangYe2017Ex52(x,y,keyf,keyxy)
% This file provides all functions defining NieWangYe2017Ex52 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 3 5 2]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x'*[y(1);y(2)]+prod(x)*prod(y);
    case 'G'; w = [-x-1; x-1; y(1)*y(2)-x(1)^2]; 
    case 'f'; w = x(1)*(y(1)^2)+(x(2)^2)*y(2)*y(3)-y(1)*(y(3)^2);  
    case 'g'; w = [1-y'*y; y'*y-2];   
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [y(1)+x(2)*prod(y);y(2)+x(1)*prod(y)];         
        case 'y' ; w = [x;0]+prod(x)*[y(2)*y(3); y(1)*y(3); y(1)*y(2)];        
        case 'xx'; w = [0 prod(y); prod(y) 0];
        case 'xy'; w = [1+x(2)*y(2)*y(3) x(1)*y(2)*y(3);
                        x(2)*y(1)*y(3)   1+x(1)*y(1)*y(3);
                        x(2)*y(1)*y(2)   x(1)*y(1)*y(2)];
        case 'yy'; w = prod(x)*[0 y(3) y(2); y(3) 0 y(1);  y(2) y(1) 0];
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-eye(2); eye(2); -2*x(1) 0];    
        case 'y' ; w = [zeros(4,3); y(2) y(1) 0];       
        case 'xx'; w = zeros(10,2); w(9,1)=-2;
        case 'xy'; w = zeros(15,2);
        case 'yy'; w = [zeros(12,3); 0 1 0; 1 0 0; 0 0 0];
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = [y(1)^2; 2*x(2)*y(2)*y(3)];    
        case 'y' ; w = [2*x(1)*y(1)-y(3)^2; (x(2)^2)*y(3); (x(2)^2)*y(2)-2*y(1)*y(3)];         
        case 'xx'; w = [0 0; 0 2*y(2)*y(3)];
        case 'xy'; w = [2*y(1) 0; 0 2*x(2)*y(3); 0 2*x(2)*y(2)];
        case 'yy'; w = [2*x(1) 0 -2*y(3); 0 0  x(2)^2; -2*y(3) x(2)^2 -2*y(1)];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = zeros(2);
        case 'y' ; w = [-2*y'; 2*y'];           
        case 'xx'; w = zeros(4,2); 
        case 'xy'; w = zeros(6,2);   
        case 'yy'; w = [-2*eye(3);2*eye(3)];  
        end        
   end   
end
end


