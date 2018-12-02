function w=WanWangLv2011(x,y,keyf,keyxy)
% This file provides all functions defining WanWangLv2011 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 3 0 8]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (1+[1 -1]*x+2*y(2))*(8-x(1)+[-2 1 5]*y);
    case 'G'; w = [];
    case 'f'; w = [2 -1 1]*y;  
    case 'g'; w = [[-1 1 1]*y-1; 2*x(1)+[-1 2 -.5]*y-1; 
                  2*x(2)+[2 -1 -.5]*y-1;  -x; -y];    
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [8-x(1)+[-2 1 5]*y-(1+x(1)-x(2)+2*y(2));
                       -(8-x(1)+[-2 1 5]*y) ];         
        case 'y' ; w = [-2;1;5]*(1+x(1)-x(2)+2*y(2))+[0; 2*(8-x(1)+[-2 1 5]*y); 0];    
        case 'xx'; w = [-2 1; 1 0];
        case 'xy'; w = [-2 2; -1 -1; 5 -5];
        case 'yy'; w = [0 -4 0; -4 4 10; 0 10 0];
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
        case 'x' ; w = [0; 0];    
        case 'y' ; w = [2; -1; 1];          
        case 'xx'; w = zeros(2,2);
        case 'xy'; w = zeros(3,2);
        case 'yy'; w = zeros(3,3);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [0 0; 2 0; 0 2; -eye(2); zeros(3,2)];
        case 'y' ; w = [-1 1 1; -1 2 -0.5; 2 -1 -0.5; zeros(2,3); -eye(3)];          
        case 'xx'; w = zeros(16,2);
        case 'xy'; w = zeros(24,2);
        case 'yy'; w = zeros(24,3);
        end        
   end   
end
end





% function w=fun(x,y,keyf,keyxy)
% % This file provides all functions defining WanWangLv11 problem 
% % and their first and second order derivatives.
% 
% if nargin<4
%     switch keyf
%     case 'F'; w = (1+[1 -1]*x+2*y(2))*(8-x(1)+[-2 1 5]*y);
%     case 'G'; w = -x;
%     case 'f'; w = [2 -1 1]*y;  
%     case 'g'; w = [[-1 1 1]*y-1; 2*x(1)+[-1 2 -.5]*y-1; 
%                   2*x(2)+[2 -1 -.5]*y-1;   -y];    
%     end    
% else
%     switch keyf
%     case 'F'
%         switch keyxy
%         case 'x' ; w = [8-x(1)+[-2 1 5]*y-(1+x(1)-x(2)+2*y(2));
%                        -(8-x(1)+[-2 1 5]*y) ];         
%         case 'y' ; w = [-2;1;5]*(1+x(1)-x(2)+2*y(2))+[0; 2*(8-x(1)+[-2 1 5]*y); 0];    
%         case 'xx'; w = [-2 1; 1 0];
%         case 'xy'; w = [-2 2; -1 -1; 5 -5];
%         case 'yy'; w = [0 -4 0; -4 4 10; 0 10 0];
%         end 
%     case 'G'  
%         switch keyxy            
%         case 'x' ; w = -eye(2);    
%         case 'y' ; w = zeros(2,3);        
%         case 'xx'; w = zeros(4,2);  
%         case 'xy'; w = zeros(6,2);  
%         case 'yy'; w = zeros(6,3);  
%         end           
% 	case 'f'   
%         switch keyxy
%         case 'x' ; w = [0; 0];    
%         case 'y' ; w = [2; -1; 1];          
%         case 'xx'; w = zeros(2,2);
%         case 'xy'; w = zeros(3,2);
%         case 'yy'; w = zeros(3,3);
%         end           
% 	case 'g'   
%         switch keyxy
%         case 'x' ; w = [0 0; 2 0; 0 2;  zeros(3,2)];
%         case 'y' ; w = [-1 1 1; -1 2 -0.5; 2 -1 -0.5;  -eye(3)];          
%         case 'xx'; w = zeros(12,2);
%         case 'xy'; w = zeros(18,2);
%         case 'yy'; w = zeros(18,3);
%         end        
%    end   
% end
% end
% 
