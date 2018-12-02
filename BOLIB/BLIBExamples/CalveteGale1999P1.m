function w=CalveteGale1999P1(x,y,keyf,keyxy)
% This file provides all functions defining CalveteGale1999P1 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 3 2 6]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -8*x(1)-4*x(2)+4*y(1)-40*y(2)-4*y(3); 
    case 'G'; w = -x;   
    case 'f'; w =(1+x(1)+x(2)+2*y(1)-y(2)+y(3))/(6+2*x(1)+y(1)+y(2)-3*y(3));
    case 'g'; w = [-y;  -y(1)+y(2)+y(3)-1; 2*x(1)-y(1)+2*y(2)-0.5*y(3)-1;
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
        case 'x' ; w = -eye(2); 
        case 'y' ; w = zeros(2,3);         
        case 'xx'; w = zeros(4,2);
        case 'xy'; w = zeros(6,2);
        case 'yy'; w = zeros(6,3);
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
                   %w= [- 5/q^2+4*p /q^3,  1/q^2+4*p /q^3,  1/q^2+12*p /q^3 ;  
                   %    - 1/q^2, - 1/q^2, 3/q^2]'; 
        case 'yy'; w = f0*(b/p-d/q)*(b/p-d/q)'+f0*(-b*b'/p^2+d*d'/q^2);
                   %w=[-4/q^2 + 2*p/q^3, -1/q^2 + 2*p/q^3,   5/q^2 - 6*p/q^3;
                   %   -1/q^2 + 2*p/q^3,  2/q^2 + 2*p/q^3, - 4/q^2 - 6*p /q^3;
                   %    5/q^2 - 6*p/q^3, -4/q^2 - 6*p/q^3,   6/q^2 + 18*p/q^3]; 
        end         
	case 'g'   
        switch keyxy
        case 'x' ; w = [zeros(4,2); 2 0; 0 2];
        case 'y' ; w = [-eye(3);  -1 1 1; -1 2 -0.5; 2 -1 -0.5];          
        case 'xx'; w = zeros(12,2);
        case 'xy'; w = zeros(18,2);
        case 'yy'; w = zeros(18,3);
        end        
   end   
end
end


