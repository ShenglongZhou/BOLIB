function w=OutrataCervinka2009(x,y,keyf,keyxy)
% This file provides all functions defining OutrataCervinka2009 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 1 3]

 
if nargin<4  || isempty(keyxy)
    switch keyf
    case 'F'; w = -[2 0.5]*x-[0 1]*y;
    case 'G'; w = [1 0]*x;   
    case 'f'; w = [1 -1]*y+x'*y+y'*y/2; 
    case 'g'; w = [0 1; -1 1; 1 1]*y;   
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = -[2; 0.5];         
        case 'y' ; w = -[0; 1];     
        case 'xx'; w = zeros(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = zeros(2);
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [1 0];    
        case 'y' ; w = zeros(1,2);          
        case 'xx'; w = zeros(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = zeros(2);
        end           
	case 'f'    
        switch keyxy
        case 'x' ; w = y;    
        case 'y' ; w = [1; -1]+x+y;        
        case 'xx'; w = zeros(2);
        case 'xy'; w = eye(2);
        case 'yy'; w = eye(2);
        end         
	case 'g'    
        switch keyxy
        case 'x' ; w = zeros(3,2);
        case 'y' ; w = [0 1; -1 1; 1 1];                
        case 'xx'; w = zeros(6,2);
        case 'xy'; w = zeros(6,2);
        case 'yy'; w = zeros(6,2);
        end        
   end   
end
end


