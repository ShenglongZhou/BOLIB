function w=GumusFloudas2001Ex3(x,y,keyf,keyxy)
% This file provides all functions defining GumusFloudas2001Ex3 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 3 4 9]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -8*x(1)-4*x(2)+4*y(1)-40*y(2)-4*y(3); 
    case 'G'; w = [-x; x-2];  
    case 'f'; w =(1+x(1)+x(2)+2*y(1)-y(2)+y(3))/(6+2*x(1)+y(1)+y(2)-3*y(3));
    case 'g'; w = [-y; y-2;  -y(1)+y(2)+y(3)-1; 2*x(1)-y(1)+2*y(2)-0.5*y(3)-1;
                   2*x(2)+2*y(1)-y(2)-0.5*y(3)-1];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [-8; -4];         
        case 'y' ; w = [ 4; -40; -4];       
        case 'xx'; w = zeros(2,2);
        case 'xy'; w = zeros(3,2);
        case 'yy'; w = zeros(3,3);
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-eye(2); eye(2)];    
        case 'y' ; w = zeros(4,3);         
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(12,2);
        case 'yy'; w = zeros(12,3);
        end           
	case 'f'   
        a = [1;1]; 
        b = [2;-1; 1]; 
        c = [2;0];
        d = [1;1;-3];
        p = 1+a'*x+b'*y;
        q = 6+c'*x+d'*y;
        f0= p/q;
        switch keyxy            
        case 'x' ; w = f0*(a/p-c/q);    
        case 'y' ; w = f0*(b/p-d/q);
        case 'xx'; w = f0*(a/p-c/q)*(a/p-c/q)'+f0*(-a*a'/p^2+c*c'/q^2);
        case 'xy'; w = f0*(b/p-d/q)*(a/p-c/q)'+f0*(-b*a'/p^2+d*c'/q^2);
        case 'yy'; w = f0*(b/p-d/q)*(b/p-d/q)'+f0*(-b*b'/p^2+d*d'/q^2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [zeros(7,2); 2 0; 0 2];
        case 'y' ; w = [-eye(3); eye(3); -1 1 1; -1 2 -0.5; 2 -1 -0.5];          
        case 'xx'; w = zeros(18,2);
        case 'xy'; w = zeros(27,2);
        case 'yy'; w = zeros(27,3);
        end        
   end   
end
end