function w=IshizukaAiyoshi1992a(x,y,keyf,keyxy)
% This file provides all functions defining IshizukaAiyoshi1992a problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [1 2 1 5]

M = 4; % M > 1 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x*y(2)^2;
    case 'G'; w = -x-M;    
    case 'f'; w = y(1);  
    case 'g'; w = -[1; 1; 1; 0; 0]*x+[0 0; -1 0; 1 0; -1 -1; 1 1]*y-[ 0; 0; 0; M; M];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w =  y(2)^2;         
        case 'y' ; w = [0; 2*x*y(2)];     
        case 'xx'; w =  0;
        case 'xy'; w = [0  ; 2*y(2)];
        case 'yy'; w = [0 0; 0 2*x ];
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = -1 ;    
        case 'y' ; w = [0 0];          
        case 'xx'; w =  0;
        case 'xy'; w = [0;0];
        case 'yy'; w = [0 0;0 0];
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w =  0;   
        case 'y' ; w = [1; 0];         
        case 'xx'; w =  0;
        case 'xy'; w = [0; 0];
        case 'yy'; w = [0 0; 0 0];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = -[1; 1; 1; 0; 0];   
        case 'y' ; w = [0 0; -1 0; 1 0; -1 -1; 1 1];          
        case 'xx'; w = zeros(5,1);
        case 'xy'; w = zeros(10,1);
        case 'yy'; w = zeros(10,2);
        end        
   end   
end

end


