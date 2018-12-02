function w=MuuQuy2003Ex1(x,y,keyf,keyxy)
% This file provides all functions defining MuuQuy2003Ex1 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 2 3]

  
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x^2-4*x+y'*y;
    case 'G'; w = [-x;x-2];
    case 'f'; w = y(1)^2+y(2)^2/2+y(1)*y(2)+[1-3*x 1+x]*y; 
    case 'g'; w = [[2 1]*y-2*x-1; -y];  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*x-4;         
        case 'y' ; w = 2*y;    
        case 'xx'; w = 2;
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = 2*eye(2);
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
        case 'x' ; w = -3*y(1)+y(2);    
        case 'y' ; w = [2*y(1)+y(2)+1-3*x; y(2)+y(1)+1+x];         
        case 'xx'; w = 0;
        case 'xy'; w = [-3;1];
        case 'yy'; w = [2 1; 1 1];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [ -2; 0;0];
        case 'y' ; w = [2 1; -eye(2)];             
        case 'xx'; w = zeros(3,1);
        case 'xy'; w = zeros(6,1);
        case 'yy'; w = zeros(6,2);
        end        
   end   
end
end


