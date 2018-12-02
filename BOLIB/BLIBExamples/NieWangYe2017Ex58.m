function w=NieWangYe2017Ex58(x,y,keyf,keyxy)
% This file provides all functions defining NieWangYe2017Ex58 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [4 4 3 2]

 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = sum(x)*sum(y);
    case 'G'; w = [x'*x-1; y(3)^2-x(4); y(2)*y(4)-x(1)]; 
    case 'f'; w = x(1)*y(1)+x(2)*y(2)+0.1*y(3)+0.5*y(4)-y(3)*y(4);  
    case 'g'; w = [[1 2 3 4 ]*(y.*y)-x(1)^2-x(3)^2-x(2)-x(4); y(2)*y(3)-y(1)*y(4)];   
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = sum(y)*[1;1;1;1];         
        case 'y' ; w = sum(x)*[1;1;1;1];        
        case 'xx'; w = zeros(4);
        case 'xy'; w = ones(4);
        case 'yy'; w = zeros(4); 
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [2*x';  0 0 0 -1; -1 0 0 0];    
        case 'y' ; w = [0 0 0 0; 0 0 2*y(3) 0; 0 y(4) 0 y(2)];       
        case 'xx'; w = [2*eye(4); zeros(8,4)];
        case 'xy'; w = zeros(12,4);
        case 'yy'; w = [zeros(6,4); 0 0 2 0; zeros(2,4); 0 0 0 1; 0 0 0 0; 0 1 0 0]; 
        end           
	case 'f'    
        switch keyxy
        case 'x' ; w = [y(1); y(2); 0; 0;];    
        case 'y' ; w = [x(1); x(2); 0.1-y(4); 0.5-y(3)];         
        case 'xx'; w = zeros(4);
        case 'xy'; w = [1 0 0 0; 0 1 0 0; 0 0 0  0; 0 0  0 0];
        case 'yy'; w = [0 0 0 0; 0 0 0 0; 0 0 0 -1; 0 0 -1 0];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [-2*x(1) -1 -2*x(3)  -1; 0 0 0 0];
        case 'y' ; w = [[2 4 6 8 ].*y'; -y(4) y(3) y(2) -y(1)];           
        case 'xx'; w = [-2 0 0 0; 0 0 0 0; 0  0 -2 0; zeros(5,4)]; 
        case 'xy'; w = zeros(8,4);   
        case 'yy'; w = [diag([2 4 6 8 ]); 0 0 0 -1; 0 0 1 0; 0 1 0 0; -1 0 0 0];  
        end        
   end   
end
end


