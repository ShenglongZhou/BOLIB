function w=AiyoshiShimizu1984Ex2(x,y,keyf,keyxy)
% This file provides all functions defining AiyoshiShimizu1984Ex2 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 5 6]   
 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = 2*x(1)+2*x(2)-3*y(1)-3*y(2)-60;
    case 'G'; w = [x(1)+x(2)+y(1)-2*y(2)-40; x-50; -x];
    case 'f'; w = (y(1)-x(1)+20)^2+(y(2)-x(2)+20)^2;
    case 'g'; w = [2*y-x+10; -y-10; y-20];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [ 2;  2];         
        case 'y' ; w = [-3; -3];  
        case 'xx'; w = zeros(2,2);
        case 'xy'; w = zeros(2,2);
        case 'yy'; w = zeros(2,2);
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [1  1; 1 0; 0 1; -1 0; 0 -1];    
        case 'y' ; w = [1 -2; 0 0; 0 0;  0 0; 0  0];         
        case 'xx'; w = zeros(10,2);
        case 'xy'; w = zeros(10,2);
        case 'yy'; w = zeros(10,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ;  w = [-2*(y(1)-x(1)+20); -2*(y(2)-x(2)+20)] ;    
        case 'y' ;  w = [ 2*(y(1)-x(1)+20);  2*(y(2)-x(2)+20)];           
        case 'xx';  w = [ 2 0; 0  2];
        case 'xy';  w = [-2 0; 0 -2];
        case 'yy';  w = [ 2 0; 0  2];
%         case 'xyx'; w = [];
%         case 'xyy'; w = [];
%         case 'yyy'; w = [];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [-1 0; 0 -1;  0 0; 0  0; 0 0; 0 0 ];
        case 'y' ; w = [ 2 0; 0  2; -1 0; 0 -1; 1 0; 0 1 ];               
        case 'xx'; w = zeros(12,2);
        case 'xy'; w = zeros(12,2);
        case 'yy'; w = zeros(12,2);
        end        
   end   
end

end


