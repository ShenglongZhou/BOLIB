function w=Mirrlees1999(x,y,keyf,keyxy)
% This file provides all functions defining Mirrlees1999 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 0 2]



if nargin<4  || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-2)^2+(y-1)^2;
    case 'G'; w = [];
    case 'f'; w = -x*exp(-(y+1)^2)-exp(-(y-1)^2); 
    case 'g'; w = [y-2; -y-2];  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*(x-2);         
        case 'y' ; w = 2*(y-1);    
        case 'xx'; w = 2;
        case 'xy'; w = 0;
        case 'yy'; w = 2;
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [];    
        case 'y' ; w = [];        
        case 'xx'; w = [];
        case 'xy'; w = [];
        case 'yy'; w = [];
        end           
	case 'f'    
        switch keyxy
        case 'x' ; w = -exp(-(y+1)^2);    
        case 'y' ; w =  2*x*(y+1)*exp(-(y+1)^2)+2*(y-1)*exp(-(y-1)^2);         
        case 'xx'; w = 0;
        case 'xy'; w = 2*(y+1)*exp(-(y+1)^2);
        case 'yy'; w = 2*exp(-(y-1)^2 )+ 2*exp(-(y+1)^2)*x - 4*exp(-(y-1)^2)*(y-1)^2-4*exp(-(y+1)^2)*x*(y+1)^2;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [0; 0];    
        case 'y' ; w = [1; -1];        
        case 'xx'; w = [0; 0];
        case 'xy'; w = [0; 0];
        case 'yy'; w = [0; 0];
        end        
   end   
end
end


