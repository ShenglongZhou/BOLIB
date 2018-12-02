function w=DempeLohse2011Ex31a(x,y,keyf,keyxy)
% This file provides all functions defining DempeLohse2011Ex31a problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 0 4]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = sum((x-.5).^2)-[3 3]*y;
    case 'G'; w = [];      
    case 'f'; w = sum(x.*y);     
    case 'g'; w = [sum(y)-2; -y(1)+y(2); -y];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*x-[1 1]';        
        case 'y' ; w = [-3;-3];       
        case 'xx'; w = 2*eye(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = zeros(2);
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
        case 'x' ; w = y;    
        case 'y' ; w = x;         
        case 'xx'; w = zeros(2);
        case 'xy'; w = eye(2);
        case 'yy'; w = zeros(2);
        end           
	case 'g'    
        switch keyxy
        case 'x' ; w = zeros(4,2);
        case 'y' ; w = [ 1 1 ; -1 1 ; -eye(2)];             
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = zeros(8,2);
        end        
   end   
end

end




