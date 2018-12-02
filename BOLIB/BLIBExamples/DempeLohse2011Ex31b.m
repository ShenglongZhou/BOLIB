function w=DempeLohse2011Ex31b(x,y,keyf,keyxy)
% This file provides all functions defining DempeLohse2011Ex31b problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [3 3 0 5]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = sum((x-[.5; .5; 0]).^2)-[3 3 6]*y;
    case 'G'; w = [];      
    case 'f'; w = sum(x.*y);     
    case 'g'; w = [1 1 1; -1 1 0; -eye(3)]*y-[2;0;0;0;0];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*x-[1 1 0]';        
        case 'y' ; w = [-3;-3;-6];       
        case 'xx'; w = 2*eye(3);
        case 'xy'; w = zeros(3);
        case 'yy'; w = zeros(3);
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
        case 'xx'; w = zeros(3);
        case 'xy'; w = eye(3);
        case 'yy'; w = zeros(3);
        end           
	case 'g'    
        switch keyxy
        case 'x' ; w = zeros(5,3);
        case 'y' ; w = [ 1 1 1; -1 1 0; -eye(3)];             
        case 'xx'; w = zeros(15,3);
        case 'xy'; w = zeros(15,3);
        case 'yy'; w = zeros(15,3);
        end        
   end   
end

end




