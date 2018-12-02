function w=KleniatiAdjiman2014Ex4(x,y,keyf,keyxy)
% This file provides all functions defining KleniatiAdjiman2014Ex4 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [5 5 13 11]

 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -sum(x.*x+y.*y);
    case 'G'; w = [-x-1; x-1;  y(1)*y(2)-x(1); x(1)-exp(x(2))+y(3); x(2)*(y(1)^2)]; 
    case 'f'; w = y(1)^3+(x(1)+x(2))*(y(2))^2+0.1*y(3)+(y(4)^2+y(5)^2)*x(3)*x(4)*x(5); 
    case 'g'; w = [-y-1; y-1; x(1)-0.2-y(3)^2];  
    end    
else
    switch keyf
    case 'F'  
        switch keyxy
        case 'x' ; w = -2*x;         
        case 'y' ; w = -2*y;        
        case 'xx'; w = -2*eye(5);
        case 'xy'; w =  zeros(5);
        case 'yy'; w = -2*eye(5);
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [-eye(5); eye(5); -1 0 0 0 0; 
                       1 -exp(x(2)) 0 0 0; 0 y(1)^2 0 0 0];    
        case 'y' ; w = [zeros(10,5); y(2) y(1) 0 0 0; 
                       0 0 1 0 0;  2*x(2)*y(1) 0 0 0 0];       
        case 'xx'; w = zeros(65,5); w(57,2) = -exp(x(2));
        case 'xy'; w = zeros(65,5); w(61,2) =  2*y(1);
        case 'yy'; w = zeros(65,5); w(51,2) =1; w(52,1)=1;  w(61,1)=2*x(2);
        end           
	case 'f'   
        y45=y(4)^2+y(5)^2;
        x34=x(3)*x(4);
        x35=x(3)*x(5);
        x45=x(5)*x(4);
        x345=x34*x(5);
        switch keyxy
        case 'x' ; w = [y(2)^2;  y(2)^2;  y45*x45; y45*x35; y45*x34];    
        case 'y' ; w = [3*y(1)^2; 2*(x(1)+x(2))*y(2); 0.1; 
                       2*y(4)*x345; 2*y(5)*x345];
        case 'xx'; w = y45*[zeros(2,5); 
                       0 0  0 x(5)  x(4);
                       0 0  x(5) 0  x(3);
                       0 0  x(4)  x(3) 0];
        case 'xy'; w = [0 0 0 0 0; 2*y(2) 2*y(2) 0 0 0; 0 0 0 0 0; 
                       0 0 2*y(4)*x45 2*y(4)*x35 2*y(4)*x34;
                       0 0 2*y(5)*x45 2*y(5)*x35 2*y(5)*x34];
        case 'yy'; w = diag([6*y(1) 2*(x(1)+x(2)) 0 2*x345 2*x345]);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = zeros(11,5); w(11,1)=1;
        case 'y' ; w = [-eye(5); eye(5); 0 0 -2*y(3) 0 0];           
        case 'xx'; w = zeros(55,5);  
        case 'xy'; w = zeros(55,5);   
        case 'yy'; w = zeros(55,5);  w(53,3)=-2;
        end        
   end   
end
end


