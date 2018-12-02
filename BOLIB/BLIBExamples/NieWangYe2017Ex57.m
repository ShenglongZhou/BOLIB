function w=NieWangYe2017Ex57(x,y,keyf,keyxy)
% This file provides all functions defining NieWangYe2017Ex57 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 3 5 2]

 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x(1)^2*y(1)/2+x(2)*y(2)^2-(x(1)+x(2)^2)*y(3);
    case 'G'; w = [x-1; -x-1;-sum(x)+x(1)^2+y(1)^2+y(2)^2]; 
    case 'f'; w = x(2)*(prod(y)+y(2)^2-y(3)^3);  
    case 'g'; w = [y'*y-x(1); 2*y(2)*y(3)-1];   
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [x(1)*y(1)-y(3); y(2)^2-2*x(2)*y(3)];         
        case 'y' ; w = [x(1)^2/2; 2*x(2)*y(2); -(x(1)+x(2)^2)];        
        case 'xx'; w = [y(1) 0; 0 -2*y(3)];
        case 'xy'; w = [x(1) 0; 0 2*y(2); -1 -2*x(2)];
        case 'yy'; w = diag([0 2*x(2) 0]);
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [eye(2); -eye(2); -1+2*x(1) -1];    
        case 'y' ; w = [zeros(4,3); 2*y(1) 2*y(2) 0];       
        case 'xx'; w = zeros(10,2); w(9,1)=2;
        case 'xy'; w = zeros(15,2);
        case 'yy'; w = zeros(15,3); w(13,1)=2; w(14,2)=2; 
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = [0; prod(y)+y(2)^2-y(3)^3];    
        case 'y' ; w = x(2)*[y(2)*y(3); y(1)*y(3)+2*y(2); y(2)*y(1)-3*y(3)^2];         
        case 'xx'; w = zeros(2);
        case 'xy'; w = [0 y(2)*y(3); 0 y(1)*y(3)+2*y(2); 0  y(2)*y(1)-3*y(3)^2];
        case 'yy'; w = x(2)*[0 y(3) y(2); y(3) 2 y(1); y(2) y(1) -6*y(3)];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [-1 0; 0 0];
        case 'y' ; w = [2*y'; 0  2*y(3) 2*y(2)];           
        case 'xx'; w = zeros(4,2); 
        case 'xy'; w = zeros(6,2);   
        case 'yy'; w = [2*eye(3);0 0 0; 0 0 2; 0 2 0];  
        end        
   end   
end
end


