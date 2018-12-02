function w=MuuQuy2003Ex2(x,y,keyf,keyxy)
% This file provides all functions defining MuuQuy2003Ex2 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 3 3 4]

 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = [-7 4]*x+y(1)^2+y(3)^2-y(1)*y(3)-4*y(2);
    case 'G'; w = [-x;sum(x)-1];
    case 'f'; w = y(1)^2+y(2)^2/2+y(3)^2/2+y(1)*y(2)+(1-3*x(1))*y(1)+(1+x(2))*y(2); 
    case 'g'; w = [[2 1 -1]*y+[1 -2]*x+2; -y];  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [-7; 4];         
        case 'y' ; w = [2*y(1)-y(3); -4; 2*y(3)-y(1)];    
        case 'xx'; w = zeros(2);
        case 'xy'; w = zeros(3,2);
        case 'yy'; w = [2 0 -1; 0 0 0; -1 0 2];
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-eye(2); 1 1 ];    
        case 'y' ; w = zeros(3,3);        
        case 'xx'; w = zeros(6,2);
        case 'xy'; w = zeros(9,2);
        case 'yy'; w = zeros(9,3);
        end           
	case 'f'    
        switch keyxy
        case 'x' ; w = [-3*y(1);y(2)];    
        case 'y' ; w = [2*y(1)+y(2)+1-3*x(1); y(2)+y(1)+1+x(2); y(3)];         
        case 'xx'; w = zeros(2);
        case 'xy'; w = [-3 0; 0 1; 0 0];
        case 'yy'; w = [2 1 0; 1 1 0; 0 0 1];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [1 -2; zeros(3,2)];
        case 'y' ; w = [2 1 -1; -eye(3)];             
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(12,2);
        case 'yy'; w = zeros(12,3);
        end        
   end   
end
end


