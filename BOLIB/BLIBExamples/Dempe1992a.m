function w=Dempe1992a(x,y,keyf,keyxy)
% This file provides all functions defining Dempe1992a problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 1 2]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = y(2);
    case 'G'; w = sum((x+[0;1]).^2)-1; 
    case 'f'; w = .5*sum((y-[1;0]).^2);      
    case 'g'; w = [y(1)+y(2)*x(1)+x(2); y(1)];  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [0;0];         
        case 'y' ; w = [0;1];        
        case 'xx'; w = zeros(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = zeros(2);
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = 2*(x+[0;1])';    
        case 'y' ; w = zeros(1,2);      
        case 'xx'; w = 2*eye(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = zeros(2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = zeros(2,1);    
        case 'y' ; w = y-[1;0];          
        case 'xx'; w = zeros(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = eye(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [y(2) 1; 0 0];
        case 'y' ; w = [1 x(1); 1 0];                
        case 'xx'; w = zeros(4,2);
        case 'xy'; w = [0 0; 1 0; 0 0; 0 0];
        case 'yy'; w = zeros(4,2);
        end        
   end   
end

end



