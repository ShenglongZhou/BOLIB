function w=SinhaMaloDeb2014TP7(x,y,keyf,keyxy)
% This file provides all functions defining SinhaMaloDeb2014TP7 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 4 4]


 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -(x(1)+y(1))*(x(2)+y(2))/(1+sum(x.*y)); 
    case 'G'; w = [-x; [1 -1]*x; sum(x.*x)-100];
    case 'f'; w = (x(1)+y(1))*(x(2)+y(2))/(1+sum(x.*y));  
    case 'g'; w = [-y;y-x];    
    end    
else
    switch keyf 
    case 'F'
        A  = [0 1; 1 0];
        z  = x+y; 
        xy = 1+sum(x.*y);
        f0 = (x(1)+y(1))*(x(2)+y(2))/xy;
        switch keyxy
        case 'x' ; w  = -(A*z-f0*y)/xy;         
        case 'y' ; w  = -(A*z-f0*x)/xy;  
        case 'xx'; fx =  (A*z-f0*y)/xy;
                   w  = -(A -fx*y'-y*fx')/xy; 
        case 'xy'; fx =  (A*z-f0*y)/xy; 
                   fy =  (A*z-f0*x)/xy;
                   w  = -(A -fy*y'-x*fx'-f0*eye(2))/xy; 
        case 'yy'; fy =  (A*z-f0*x)/xy;
                   w  = -(A -fy*x'-x*fy')/xy;  
        end
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-eye(2); 1 -1; 2*x'];    
        case 'y' ; w = zeros(4,2);         
        case 'xx'; w = [zeros(6,2); 2*eye(2)];
        case 'xy'; w = zeros(8,2); 
        case 'yy'; w = zeros(8,2); 
        end           
	case 'f'  
        A  = [0 1; 1 0];
        z  = x+y; 
        xy = 1+sum(x.*y);
        f0 = (x(1)+y(1))*(x(2)+y(2))/xy;
        switch keyxy
        case 'x' ; w  = (A*z-f0*y)/xy;         
        case 'y' ; w  = (A*z-f0*x)/xy;  
        case 'xx'; fx = (A*z-f0*y)/xy;
                   w  = (A -fx*y'-y*fx')/xy; 
        case 'xy'; fx = (A*z-f0*y)/xy; 
                   fy = (A*z-f0*x)/xy;
                   w  = (A -fy*y'-x*fx'-f0*eye(2))/xy; 
        case 'yy'; fy = (A*z-f0*x)/xy;
                   w  = (A -fy*x'-x*fy')/xy;  
        end        
	case 'g'   
        switch keyxy
        case 'x' ; w = [zeros(2);-eye(2)];
        case 'y' ; w = [-eye(2);  eye(2)];            
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = zeros(8,2);
        end        
   end   
end
end


