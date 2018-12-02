function w=Colson2002BIPA3(x,y,keyf,keyxy)
% This file provides all functions defining Colson2002BIPA3 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 2]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-5)^4+(2*y+1)^4;
    case 'G'; w = [x+y-4; -x]; 
    case 'f'; w = exp(-x+y)+x^2+2*x*y+y^2+2*x+6*y;     
    case 'g'; w = [-x+y-2; -y]; 
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 4*(x-5)^3;         
        case 'y' ; w = 8*(2*y+1)^3;         
        case 'xx'; w = 12*(x-5)^2;
        case 'xy'; w = 0;
        case 'yy'; w = 48*(2*y+1)^2;
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [1; -1];    
        case 'y' ; w = [1;  0];          
        case 'xx'; w = zeros(2,1);
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,1);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = -exp(-x+y)+2*x+2*y+2;    
        case 'y' ; w =  exp(-x+y)+2*x+2*y+6;          
        case 'xx'; w =  exp(-x+y)+2;
        case 'xy'; w = -exp(-x+y)+2;
        case 'yy'; w =  exp(-x+y)+2;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [-1;  0];
        case 'y' ; w = [ 1; -1];              
        case 'xx'; w = zeros(2,1);
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,1);
        end        
   end   
end

end



