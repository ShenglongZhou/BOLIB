function w=Colson2002BIPA5(x,y,keyf,keyxy)
% This file provides all functions defining Colson2002BIPA5 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 1 6]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-y(2))^4+(y(1)-1)^2+(y(1)-y(2))^2;
    case 'G'; w = -x; 
    case 'f'; w = 2*x+exp(y(1))+y(1)^2+4*y(1)+2*y(2)^2-6*y(2);    
    case 'g'; w = [6*x+y(1)^2+exp(y(2))-15; 5*x+y(1)^4-y(2)-25; y(1)-4; y(2)-2; -y];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 4*(x-y(2))^3;         
        case 'y' ; w = [2*(y(1)-1)+2*(y(1)-y(2)); -4*(x-y(2))^3-2*(y(1)-y(2))];          
        case 'xx'; w = 12*(x-y(2))^2;
        case 'xy'; w = [0;  -12*(x-y(2))^2];
        case 'yy'; w = [4 -2; -2 12*(x-y(2))^2+2];
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = -1;    
        case 'y' ; w = [0 0];          
        case 'xx'; w = 0;
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 2; 
        case 'y' ; w = [exp(y(1))+2*y(1)+4; 4*y(2)-6];      
        case 'xx'; w = 0;
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = [exp(y(1))+2 0; 0 4];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [6; 5; zeros(4,1)];
        case 'y' ; w = [2*y(1) exp(y(2)); 4*y(1)^3 -1; eye(2); -eye(2)];               
        case 'xx'; w = zeros(6,1);
        case 'xy'; w = zeros(12,1);
        case 'yy'; w = [2 0; 0 exp(y(2)); 12*y(1)^2 0; zeros(9,2)];
        end        
   end   
end

end



