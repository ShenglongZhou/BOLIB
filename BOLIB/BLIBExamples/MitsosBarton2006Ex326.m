function w=MitsosBarton2006Ex326(x,y,keyf,keyxy)
% This file provides all functions defining MitsosBarton2006Ex326 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 3 7 6]

 
 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x(1)*y(1)+x(2)*y(2)^2+x(1)*x(2)*(y(3))^3;
    case 'G'; w = [-x-1; x-1;0.1-x(1)^2; 1.5-sum(y.*y); -2.5+sum(y.*y)]; 
    case 'f'; w = x(1)*y(1)^2+x(2)*(y(2))^2+(x(1)-x(2))*(y(3))^2;  
    case 'g'; w = [-y-1; y-1];   
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [y(1)+x(2)*(y(3))^3; y(2)^2+x(1)*(y(3))^3 ];         
        case 'y' ; w = [x(1);  2*x(2)*y(2); 3*x(1)*x(2)*(y(3))^2 ];        
        case 'xx'; w = [0 y(3)^3; y(3)^3 0];
        case 'xy'; w = [1 0; 0 2*y(2); 3*x(2)*(y(3))^2 3*x(1)*(y(3))^2];
        case 'yy'; w = [0 0 0; 0 2*x(2) 0; 0 0 6*x(1)*x(2)*y(3)];
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-eye(2); eye(2); -2*x(1) 0; zeros(2,2)];    
        case 'y' ; w = [zeros(5,3); -2*y'; 2*y'];       
        case 'xx'; w = [zeros(8,2); -2 0; 0 0; zeros(4,2)];
        case 'xy'; w =  zeros(21,2);
        case 'yy'; w = [zeros(15,3); -2*eye(3); 2*eye(3)];
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = [y(1)^2+(y(3))^2; y(2)^2-(y(3))^2];    
        case 'y' ; w = [2*x(1)*y(1); 2*x(2)*y(2); 2*(x(1)-x(2))*y(3)];         
        case 'xx'; w = [0 0;0 0];
        case 'xy'; w = [2*y(1) 0; 0 2*y(2); 2*y(3) -2*y(3)];
        case 'yy'; w = [2*x(1) 0 0; 0 2*x(2) 0; 0 0 2*(x(1)-x(2))];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = zeros(6,2);
        case 'y' ; w = [-eye(3); eye(3)];           
        case 'xx'; w =  zeros(12,2);  
        case 'xy'; w =  zeros(18,2);   
        case 'yy'; w =  zeros(18,3);  
        end        
   end   
end
end


