function w=SinhaMaloDeb2014TP6(x,y,keyf,keyxy)
% This file provides all functions defining SinhaMaloDeb2014TP7 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 1 6]


 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-1)^2-2*x+2*y(1); 
    case 'G'; w = -x;
    case 'f'; w = sum((2*y-[4;1]).^2)+x*y(1);  
    case 'g'; w = [-y;4*x+[5 4]*y-12;-4*x+[-5 4]*y+4; 4*x+[-4 5]*y-4;-4*x+[4 5]*y-4];     
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*(x-1)-2;         
        case 'y' ; w = [2; 0];       
        case 'xx'; w = 2;
        case 'xy'; w = zeros(2,1); 
        case 'yy'; w = zeros(2,2); 
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = -1;    
        case 'y' ; w = zeros(1,2);         
        case 'xx'; w = 0;
        case 'xy'; w = zeros(2,1); 
        case 'yy'; w = zeros(2,2); 
        end           
	case 'f'  
        switch keyxy
        case 'x' ; w = y(1);         
        case 'y' ; w = 4*(2*y-[4;1])+[x;0];       
        case 'xx'; w = 0;
        case 'xy'; w = [1;0];
        case 'yy'; w = 8*eye(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [0 0 4 -4 4 -4]';
        case 'y' ; w = [-eye(2); 5 4; -5 4; -4 5; 4 5;];            
        case 'xx'; w = zeros(6,1);
        case 'xy'; w = zeros(12,1);
        case 'yy'; w = zeros(12,2);
        end        
   end   
end
end


