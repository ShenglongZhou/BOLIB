function w=Bard1988Ex1(x,y,keyf,keyxy)
% This file provides all functions defining Bard1988Ex1 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 1 4]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-5)^2+(2*y+1)^2;
    case 'G'; w = -x; 
    case 'f'; w = (y-1)^2-1.5*x*y;     
    case 'g'; w = [-3*x+y+3; x-0.5*y-4; x+y-7; -y]; 
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*(x-5);         
        case 'y' ; w = 4*(2*y+1);          
        case 'xx'; w = 2;
        case 'xy'; w = 0;
        case 'yy'; w = 8;
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = -1;    
        case 'y' ; w = 0;        
        case 'xx'; w = 0;
        case 'xy'; w = 0;
        case 'yy'; w = 0;
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = -1.5*y;    
        case 'y' ; w = 2*(y-1)-1.5*x;           
        case 'xx'; w = 0;
        case 'xy'; w = -1.5;
        case 'yy'; w = 2;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [-3; 1; 1; 0];
        case 'y' ; w = [ 1; -0.5; 1; -1];                
        case 'xx'; w = zeros(4,1);
        case 'xy'; w = zeros(4,1);
        case 'yy'; w = zeros(4,1);
        end        
   end   
end

end

