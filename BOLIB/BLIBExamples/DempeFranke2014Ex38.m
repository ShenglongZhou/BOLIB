function w=DempeFranke2014Ex38(x,y,keyf,keyxy)
% This file provides all functions defining DempeFranke2014Ex38 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 4 4]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = [2 1]*x+[2 -1]*y;
    case 'G'; w = [-1-x(1);-1+x(1);-1-x(2);0.75+x(2)]; 
    case 'f'; w = x'*y;      
    case 'g'; w = [-2*y(1)+y(2); y-2; -y(2)];  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [2; 1];         
        case 'y' ; w = [2;-1];        
        case 'xx'; w = zeros(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = zeros(2);
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [-1 0; 1 0; 0 -1; 0 1];    
        case 'y' ; w = zeros(4,2);      
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = zeros(8,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = y;    
        case 'y' ; w = x;          
        case 'xx'; w = zeros(2);
        case 'xy'; w = eye(2);
        case 'yy'; w = 2*eye(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = zeros(4,2); 
        case 'y' ; w = [-2 1; 1 0; 0 1; 0 -1];              
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = zeros(8,2);
        end        
   end   
end

end



