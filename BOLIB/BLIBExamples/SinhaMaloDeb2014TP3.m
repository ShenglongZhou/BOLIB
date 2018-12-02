function w=SinhaMaloDeb2014TP3(x,y,keyf,keyxy)
% This file provides all functions defining SinhaMaloDeb2014TP3 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 3 4]

 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x'*diag([-1 -3])*x-4*y(1)+y(2)^2;
    case 'G'; w = [-x; x(1)^2+2*x(2)-4];
    case 'f'; w = 2*x(1)^2+y(1)^2-5*y(2);    
    case 'g'; w = [-y; [0 -1]*x+[-3 4]*y+4; -x(1)^2+2*x(1)-x(2)^2+[2 -1]*y-3];    
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*diag([-1 -3])*x;         
        case 'y' ; w = [-4;  2*y(2)];        
        case 'xx'; w =  2*diag([-1 -3]);
        case 'xy'; w = zeros(2,2);
        case 'yy'; w = diag([0 2]);
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-eye(2); 2*x(1) 2];    
        case 'y' ; w = zeros(3,2);      
        case 'xx'; w = [zeros(4,2); 2 0; 0 0];
        case 'xy'; w = zeros(6,2);
        case 'yy'; w = zeros(6,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = [4*x(1); 0];    
        case 'y' ; w = [2*y(1); -5];      
        case 'xx'; w = [4 0; 0 0];
        case 'xy'; w = [0 0; 0 0];
        case 'yy'; w = [2 0; 0 0];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [zeros(2,2); 0 -1; -2*x(1)+2 -2*x(2)];
        case 'y' ; w = [-eye(2); -3 4; 2 -1];             
        case 'xx'; w = [zeros(6,2); -2 0; 0 -2];
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = zeros(8,2);
        end        
   end   
end
end


