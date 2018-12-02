function w=Bard1991Ex1(x,y,keyf,keyxy)
% This file provides all functions defining Bard1991Ex1 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 2 3]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x+y(2);
    case 'G'; w = [-x+2; x-4];
    case 'f'; w = 2*y(1)+x*y(2);
    case 'g'; w = [x-y(1)-y(2)+4; -y];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 1;         
        case 'y' ; w = [0; 1];        
        case 'xx'; w = 0;
        case 'xy'; w = [0; 0];
        case 'yy'; w = [0 0; 0 0];
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [-1;  1];   
        case 'y' ; w = [0 0; 0 0];         
        case 'xx'; w = zeros(2,1);
        case 'xy'; w = zeros(4,1);
        case 'yy'; w = zeros(4,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = y(2);    
        case 'y' ; w = [2; x ];         
        case 'xx'; w = 0;
        case 'xy'; w = [ 0; 1];
        case 'yy'; w = [ 0 0; 0 0];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [1;  0;  0 ];
        case 'y' ; w = [-1 -1; -eye(2)];                
        case 'xx'; w = zeros(3,1);
        case 'xy'; w = zeros(6,1);
        case 'yy'; w = zeros(6,2);
        end        
   end   
end

end
