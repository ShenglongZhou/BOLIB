function w=LuDebSinha2016e(x,y,keyf,keyxy)
% This file provides all functions defining LuDebSinha2016e problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 6 3]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = (x-2.5)^2/0.04+(y(2)-50)^2/900;
    case 'G'; w = [2-x; x-3; -[4;100]-y; y-[10;200]];
    case 'f'; w = -y(2); 
    case 'g'; w = [-x*(y(1)-2)^2+y(2); 12.5*x*(y(1)-5)-y(2);
                   -5*(y(1)+4-x)*(y(1)+8-x)+y(2)];  
    end    
else
    switch keyf        
    case 'F'
        switch keyxy
        case 'x' ; w = (x-2.5)/0.02;         
        case 'y' ; w = [0;(y(2)-50)/450];    
        case 'xx'; w = 50;
        case 'xy'; w = [0;0];
        case 'yy'; w = [0 0; 0 1/450];
        end 
    case 'G' 
        switch keyxy            
        case 'x' ; w = [-1;1;zeros(4,1)];    
        case 'y' ; w = [zeros(2,2);-eye(2);eye(2)];       
        case 'xx'; w = zeros(6,1);
        case 'xy'; w = zeros(12,1);
        case 'yy'; w = zeros(12,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = 0;          
        case 'y' ; w = [0;-1];    
        case 'xx'; w = 0;
        case 'xy'; w = zeros(2,1);
        case 'yy'; w = zeros(2);
        end           
	case 'g'   
        switch keyxy            
        case 'x' ; w = [-(y(1)-2)^2; 12.5*(y(1)-5); 10*y(1)+60-10*x];    
        case 'y' ; w = [-2*x*(y(1)-2) 1;12.5*x -1; -10*y(1)-60+10*x 1];       
        case 'xx'; w = [0; 0; -10];
        case 'xy'; w = [2*(2-y(1)); 0; 12.5; 0; 10; 0];
        case 'yy'; w = [-2*x 0; 0 0; zeros(2,2);-10 0; 0 0];
        end              
   end   
end
end


