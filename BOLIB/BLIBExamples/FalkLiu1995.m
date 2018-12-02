function w=FalkLiu1995(x,y,keyf,keyxy)
% This file provides all functions defining FalkLiu1995 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 0 4]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = sum((x-1.5).^2+y.^2)-4.5;
    case 'G'; w = []; 
    case 'f'; w = sum((y-x).^2);   
    case 'g'; w = [-y+0.5; y-1.5];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*x-3;         
        case 'y' ; w = 2*y;           
        case 'xx'; w = 2*eye(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = 2*eye(2);
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
        case 'x' ; w = 2*(x-y);    
        case 'y' ; w = 2*(y-x);         
        case 'xx'; w = 2*eye(2);
        case 'xy'; w =-2*eye(2);
        case 'yy'; w = 2*eye(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = zeros(4,2);
        case 'y' ; w = [-eye(2); eye(2)];               
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = zeros(8,2);
        end        
   end   
end

end



