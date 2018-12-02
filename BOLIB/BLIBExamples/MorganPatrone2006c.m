function w=MorganPatrone2006c(x,y,keyf,keyxy)
% This file provides all functions defining MorganPatrone2006c problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 0 4]

  
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -(x+y);
    case 'G'; w = [];
    case 'f'; w = fxy(x,y); 
    case 'g'; w = [-x-2;x-2;-y-1; y-1];  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = -1;         
        case 'y' ; w = -1;    
        case 'xx'; w =  0;
        case 'xy'; w =  0;
        case 'yy'; w =  0;
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
        case 'x' ; w = fxy(x,y,'x');    
        case 'y' ; w = fxy(x,y,'y');         
        case 'xx'; w = fxy(x,y,'xx');
        case 'xy'; w = fxy(x,y,'xy');
        case 'yy'; w = fxy(x,y,'yy');
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [-1; 1; 0; 0];
        case 'y' ; w = [ 0; 0; -1; 1];             
        case 'xx'; w = [ 0; 0; 0;0];
        case 'xy'; w = [ 0; 0; 0;0];
        case 'yy'; w = [ 0; 0; 0;0];
        end        
   end   
end
end

function w = fxy(x,y,keyxy)
if nargin<3
    if     x>-2.00001 & x<=-7/4;   w=(x+7/4)*y;
    elseif x>-7/4  & x<7/4;     w=0;
    elseif x>=7/4  & x<2.00001;    w=(x-7/4)*y;
    else                        w=10^10;
    end
else
    if     x>-2.000001 & x<=-7/4; 
           switch keyxy
           case 'x' ; w = y;
           case 'y' ; w = x+7/4;             
           case 'xx'; w = 0;
           case 'xy'; w = 1;
           case 'yy'; w = 0;
           end  
    elseif x>=7/4 & x< 2.000001;  
           switch keyxy
           case 'x' ; w = y;
           case 'y' ; w = x-7/4;             
           case 'xx'; w = 0;
           case 'xy'; w = 1;
           case 'yy'; w = 0;
           end          
    else                      
           switch keyxy
           case 'x' ; w = 0;
           case 'y' ; w = 0;             
           case 'xx'; w = 0;
           case 'xy'; w = 0;
           case 'yy'; w = 0;
           end          
    end
    
end    
end

