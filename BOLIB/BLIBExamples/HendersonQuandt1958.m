function w=HendersonQuandt1958(x,y,keyf,keyxy)
% This file provides all functions defining HendersonQuandt1958 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 2 1]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (0.5*(x+y)-95)*x;
    case 'G'; w = [1;-1]*x-[200;0]; 
    case 'f'; w = (y+0.5*x-100)*y;     
    case 'g'; w = -y; 
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = x+0.5*y-95;         
        case 'y' ; w = 0.5*x;        
        case 'xx'; w = 1;
        case 'xy'; w = 0.5;
        case 'yy'; w = 0;
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [1;-1];    
        case 'y' ; w = [0; 0];           
        case 'xx'; w = [0; 0];
        case 'xy'; w = [0; 0];
        case 'yy'; w = [0; 0];
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 0.5*y;   
        case 'y' ; w = 2*y+0.5*x-100;      
        case 'xx'; w = 0;
        case 'xy'; w = 0.5;
        case 'yy'; w = 2;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = 0;
        case 'y' ; w =-1;                
        case 'xx'; w = 0;
        case 'xy'; w = 0;
        case 'yy'; w = 0;
        end        
   end   
end

end


