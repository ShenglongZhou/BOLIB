function w=CalamaiVicente1994b(x,y,keyf,keyxy)
% This file provides all functions defining CalamaiVicente1994b problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [4 2 0 6]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = sum((x-1).^2)/2+sum(y.^2)/2;
    case 'G'; w = [];      
    case 'f'; w = sum(y.^2)/2-[x(1) x(2)]*y;     
    case 'g'; [A, B,b]=data(); w = A*[x(1); x(2)]+B*y+b;
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = x-1;        
        case 'y' ; w = y;       
        case 'xx'; w = eye(4);
        case 'xy'; w = zeros(2,4);
        case 'yy'; w = eye(2);
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
        case 'x' ; w = -[y;0;0];    
        case 'y' ; w = y-[x(1); x(2)];         
        case 'xx'; w = zeros(4);
        case 'xy'; w = [-eye(2) zeros(2)];
        case 'yy'; w = eye(2);
        end           
	case 'g'    
        switch keyxy
        case 'x' ; [A]   =data(); w = [A zeros(6,2)];
        case 'y' ; [~, B]=data(); w = B;             
        case 'xx'; w = zeros(24,4);
        case 'xy'; w = zeros(12,4);
        case 'yy'; w = zeros(12,2);
        end        
   end   
end

end
function [A, B, b]=data()
A= [ eye(2);eye(2);-eye(2)];
B= [-eye(2);eye(2);-eye(2)];
b= [-1;-1;-1.5;-3;1;1]; 
end
