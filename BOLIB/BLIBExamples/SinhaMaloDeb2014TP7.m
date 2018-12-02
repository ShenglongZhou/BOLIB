function w=SinhaMaloDeb2014TP7(x,y,keyf,keyxy)
% This file provides all functions defining SinhaMaloDeb2014TP7 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 4 4]


 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -(x(1)+y(1))*(x(2)+y(2))/(1+sum(x.*y)); 
    case 'G'; w = [-x; [1 -1]*x; sum(x.*x)-100];
    case 'f'; w = (x(1)+y(1))*(x(2)+y(2))/(1+sum(x.*y));  
    case 'g'; w = [-y;y-x];    
    end    
else
    switch keyf 
    case 'F'
        z  = x+y; 
        xy = 1+sum(x.*y);
        f0 = -(x(1)+y(1))*(x(2)+y(2))/xy;
        px = 1./z-y/xy;
        py = 1./z-x/xy;
        switch keyxy
        case 'x' ; w = f0*px;         
        case 'y' ; w = f0*py;       
        case 'xx'; w = f0*(px*px'+ y*y'/xy^2- diag(z.^(-2)) );
        case 'xy'; w = f0*(py*px'+ x*y'/xy^2- diag(z.^(-2)+1/xy) );
        case 'yy'; w = f0*(py*py'+ x*x'/xy^2- diag(z.^(-2)) );
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-eye(2); 1 -1; 2*x'];    
        case 'y' ; w = zeros(4,2);         
        case 'xx'; w = [zeros(6,2); 2*eye(2)];
        case 'xy'; w = zeros(8,2); 
        case 'yy'; w = zeros(8,2); 
        end           
	case 'f'  
        z  = x+y; 
        xy = 1+sum(x.*y);
        f0 = (x(1)+y(1))*(x(2)+y(2))/xy;
        px = 1./z-y/xy;
        py = 1./z-x/xy;
        switch keyxy
        case 'x' ; w = f0*px;         
        case 'y' ; w = f0*py;       
        case 'xx'; w = f0*(px*px'+ y*y'/xy^2- diag(z.^(-2)) );
        case 'xy'; w = f0*(py*px'+ x*y'/xy^2- diag(z.^(-2)+1/xy) );
        case 'yy'; w = f0*(py*py'+ x*x'/xy^2- diag(z.^(-2)) );
        end          
	case 'g'   
        switch keyxy
        case 'x' ; w = [zeros(2);-eye(2)];
        case 'y' ; w = [-eye(2);  eye(2)];            
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = zeros(8,2);
        end        
   end   
end
end


