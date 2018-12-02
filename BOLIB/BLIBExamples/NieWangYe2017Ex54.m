function w=NieWangYe2017Ex54(x,y,keyf,keyxy)
% This file provides all functions defining NieWangYe2017Ex54 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [4 4 3 2]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x(1)^2*y(1)+x(2)*y(2)+x(3)*y(3)^2+x(4)*y(4)^2;
    case 'G'; w = [x'*x-1; y(1)*y(2)-x(1); y(3)*y(4)-x(3)^2]; 
    case 'f'; w = y(1)^2-y(2)*(x(1)+x(2))-(y(3)+y(4))*(x(3)+x(4));  
    case 'g'; w = [y'*y-1; y'*y-y(1)^2-y(1)];   
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [2*x(1)*y(1); y(2); y(3)^2; y(4)^2];         
        case 'y' ; w = [x(1)^2; x(2); 2*x(3)*y(3); 2*x(4)*y(4)];        
        case 'xx'; w = zeros(4); w(1,1) = 2*y(1);
        case 'xy'; w = diag([2*x(1)  1  2*y(3) 2*y(4)]);
        case 'yy'; w = zeros(4); w(3,3) =2*x(3); w(4,4) =2*x(4);
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [2*x'; -1 0 0 0; 0 0 -2*x(3) 0];    
        case 'y' ; w = [0 0 0 0; y(2) y(1) 0 0; 0 0 y(4) y(3)];       
        case 'xx'; w = [2*eye(4); zeros(6,4); 0 0 -2 0; 0 0 0 0];
        case 'xy'; w = zeros(12,4);
        case 'yy'; w = [zeros(4); 0 1 0 0; 1 0 0 0; zeros(4); 0 0 0 1; 0 0 1 0];
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = [-y(2); -y(2); -(y(3)+y(4)); -(y(3)+y(4))];    
        case 'y' ; w = [2*y(1); -(x(1)+x(2)); -(x(3)+x(4)); -(x(3)+x(4))];         
        case 'xx'; w = zeros(4);
        case 'xy'; w = [0 0 0 0; -1 -1 0 0; 0 0 -1 -1; 0 0 -1 -1];
        case 'yy'; w = zeros(4); w(1,1)=2;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = zeros(2,4);
        case 'y' ; w = [2*y'; -1 2*y(2) 2*y(3) 2*y(4)];           
        case 'xx'; w = zeros(8,4); 
        case 'xy'; w = zeros(8,4);   
        case 'yy'; w = [2*eye(4);diag([0 2 2 2])];  
        end        
   end   
end
end


