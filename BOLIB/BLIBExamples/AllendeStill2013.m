function w=AllendeStill2013(x,y,keyf,keyxy)
% This file provides all functions defining AllendeStill2013 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 5 2]  


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x(1)-1)^2 + (x(2)-1)^2  +y'*y;
    case 'G'; w = [-x; x(1)-2; -y]; 
    case 'f'; w = y'*y-2*x'*y;
    case 'g'; w = (y-1).^2-0.25;  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [2*x(1)-2; 2*x(2)-2];         
        case 'y' ; w = 2*y;         
        case 'xx'; w = [2 0; 0 2];
        case 'xy'; w = zeros(2,2);
        case 'yy'; w = 2*eye(2);
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [-eye(2); 1 0; 0 0; 0 0];    
        case 'y' ; w = [ 0 0; 0 0; 0 0;-eye(2)];   
        case 'xx'; w = zeros(10,2);
        case 'xy'; w = zeros(10,2);
        case 'yy'; w = zeros(10,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = -2*y;    
        case 'y' ; w = 2*(y-x);         
        case 'xx'; w = zeros(2);
        case 'xy'; w = -2*eye(2);
        case 'yy'; w = 2*eye(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = zeros(2,2);
        case 'y' ; w = 2*diag(y-1);            
        case 'xx'; w = zeros(4,2);
        case 'xy'; w = zeros(4,2);
        case 'yy'; w = [2 0; 0 0; 0 0; 0 2];
        end        
   end   
end

end

