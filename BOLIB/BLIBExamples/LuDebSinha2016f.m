function w=LuDebSinha2016f(x,y,keyf,keyxy)
% This file provides all functions defining LuDebSinha2016f problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 1 9 0]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -x(2);
    case 'G'; x1= x(1)/20;
              w = [2-y; y-4; -[80;100]-x; x-[200;200];
                   -y*(x1-2)^2+x(2); 12.5*y*(x1-5)-x(2);
                   -5*(x1+4-y)*(x1+8-y)+x(2) ];
    case 'f'; w = (x(1)-50)^2/784+(y-2.5)^2/0.04; 
    case 'g'; w = [];  
    end
else  
    switch keyf        
    case 'F'
        switch keyxy
        case 'x' ; w = [0;-1];         
        case 'y' ; w =  0;    
        case 'xx'; w = [0 0; 0 0];
        case 'xy'; w = [0 0];
        case 'yy'; w =  0;
        end 
    case 'G' 
        x1= x(1)/20;
        switch keyxy            
        case 'x' ; w = [0 0;0 0;-eye(2);eye(2);-y*(x1-2)/10 1;12.5*y/20 -1; (-10*x1-60+10*y)/20 1];    
        case 'y' ; w = [-1; 1; 0;0;0;0;-(x1-2)^2;12.5*(x1-5);10*x1+60-10*y];       
        case 'xx'; w = [zeros(12,2); -y/200 0; 0 0; 0 0; 0 0; -1/40 0; 0 0];
        case 'xy'; w = [zeros(6,2); -(x1-2)/10 0; 12.5/20 0; 1/2 0];
        case 'yy'; w = [zeros(8,1); -10];
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = [(x(1)-50)/392; 0];          
        case 'y' ; w = (y-2.5)/0.02;    
        case 'xx'; w = [1/392 0; 0 0 ];
        case 'xy'; w = [0 0];
        case 'yy'; w = 50;
        end           
	case 'g'   
        switch keyxy            
        case 'x' ; w = [];    
        case 'y' ; w = [];       
        case 'xx'; w = [];
        case 'xy'; w = [];
        case 'yy'; w = [];
        end              
   end   
end
end


