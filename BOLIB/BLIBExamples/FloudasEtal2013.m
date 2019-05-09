function w=FloudasEtal2013(x,y,keyf,keyxy)
% This file provides all functions defining FloudasEtal2013 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 4 7]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = [2 2]*x-[3 3]*y-60;
    case 'G'; w = [x-50; -x];      
    case 'f'; w = sum( (y-x+20).^2 );        
    case 'g'; w = [2*y-x+10;[1 1]*x+[1 -2]*y-40; -y-10;y-20];     
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [ 2;  2 ];         
        case 'y' ; w = [-3; -3 ];         
        case 'xx'; w = zeros(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = zeros(2);
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [eye(2); -eye(2)];    
        case 'y' ; w = zeros(4,2); 
        case 'xx'; w = zeros(8, 2);
        case 'xy'; w = zeros(8, 2);
        case 'yy'; w = zeros(8, 2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = -2*(y-x+20);   
        case 'y' ; w = 2*(y-x+20);           
        case 'xx'; w = 2*eye(2);
        case 'xy'; w =-2*eye(2);
        case 'yy'; w = 2*eye(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [-eye(2);  1 1; zeros(4,2)];   
        case 'y' ; w = [2*eye(2); 1 -2;-eye(2);eye(2)];      
        case 'xx'; w = zeros(14, 2);
        case 'xy'; w = zeros(14, 2);
        case 'yy'; w = zeros(14, 2);
        end        
   end   
end

end


