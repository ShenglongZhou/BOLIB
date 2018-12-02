function w=Colson2002BIPA1(x,y,keyf,keyxy)
% This file provides all functions defining Colson2002BIPA1 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 1 3 3]

if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (10-x)^3+(10-y)^3;
    case 'G'; w = [x-5; -x+y; -x]; 
    case 'f'; w = (x+2*y-15)^4;     
    case 'g'; w = [x+y-20; y-20; -y]; 
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w =-3*(10-x)^2;         
        case 'y' ; w =-3*(10-y)^2;          
        case 'xx'; w = 6*(10-x);
        case 'xy'; w = 0;
        case 'yy'; w = 6*(10-y);
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [1; -1; -1];    
        case 'y' ; w = [0;  1;  0];         
        case 'xx'; w = zeros(3,1);
        case 'xy'; w = zeros(3,1);
        case 'yy'; w = zeros(3,1);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 4*(x+2*y-15)^3;    
        case 'y' ; w = 8*(x+2*y-15)^3;       
        case 'xx'; w = 12*(x+2*y-15)^2;
        case 'xy'; w = 24*(x+2*y-15)^2;
        case 'yy'; w = 48*(x+2*y-15)^2;            
%         case 'xyx'; w = 48*x  + 96*y  - 720;
%         case 'xyy'; w = 96*x  + 192*y - 1440;
%         case 'yyy'; w = 192*x + 384*y - 2880;
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [1; 0;   0];
        case 'y' ; w = [1; 1;  -1];            
        case 'xx'; w = zeros(3,1);
        case 'xy'; w = zeros(3,1);
        case 'yy'; w = zeros(3,1);
        end        
   end   
end

end


