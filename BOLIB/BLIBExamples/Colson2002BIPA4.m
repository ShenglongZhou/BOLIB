function w=Colson2002BIPA4(x,y,keyf,keyxy)
% This file provides all functions defining Colson2002BIPA4 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 2]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x^2+(y-10)^2;
    case 'G'; w = [x+2*y-6; -x]; 
    case 'f'; w = x^3+2*y^3+x-2*y-x^2;     
    case 'g'; w = [-x+2*y-3; -y];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*x;         
        case 'y' ; w = 2*(y-10);         
        case 'xx'; w = 2;
        case 'xy'; w = 0;
        case 'yy'; w = 2;
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [1; -1];    
        case 'y' ; w = [2;  0];          
        case 'xx'; w = zeros(2,1);
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,1);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 3*x^2+1-2*x;    
        case 'y' ; w = 6*y^2-2;        
        case 'xx'; w = 6*x-2;
        case 'xy'; w = 0;
        case 'yy'; w = 12*y;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [-1;  0];
        case 'y' ; w = [ 2; -1];            
        case 'xx'; w = zeros(2,1);
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,1);
        end        
   end   
end

end


