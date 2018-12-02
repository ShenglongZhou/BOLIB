function w=BardBook1998(x,y,keyf,keyxy)
% This file provides all functions defining BardBook1998 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 4 7]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = sum((y-x+20).^2);
    case 'G'; w = [x-50; -x];
    case 'f'; w = [2 2]*x-[3 3]*y-60;     
    case 'g'; w = [[1 1]*x+[1 -2]*y-40;  2*y-x+10; y-20; -y-10]; 
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w =-2*(y-x+20);          
        case 'y' ; w = 2*(y-x+20);  
        case 'xx'; w = 2*eye(2);
        case 'xy'; w =-2*eye(2);
        case 'yy'; w = 2*eye(2);
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [eye(2); -eye(2) ];
        case 'y' ; w = zeros(4,2);              
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = zeros(8,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = [ 2;  2];    
        case 'y' ; w = [-3; -3];          
        case 'xx'; w = zeros(2,2);
        case 'xy'; w = zeros(2,2);
        case 'yy'; w = zeros(2,2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [1  1; -eye(2); zeros(4,2)];
        case 'y' ; w = [1 -2; 2*eye(2); eye(2); -eye(2)];              
        case 'xx'; w = zeros(14,2);
        case 'xy'; w = zeros(14,2);
        case 'yy'; w = zeros(14,2);
        end        
   end   
end

end




