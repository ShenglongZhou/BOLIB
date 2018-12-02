function w=MitsosBarton2006Ex325(x,y,keyf,keyxy)
% This file provides all functions defining MitsosBarton2006Ex325 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 3 6 9]

  
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = x(1)*y(1)+x(2)*(y(1))^2-x(1)*x(2)*y(3);
    case 'G'; w = [-x-1; x-1; 0.1*y(1)*y(2)-x(1)^2; x(2)*(y(1))^2];
    case 'f'; w = x(1)*(y(1))^2+x(2)*y(2)*y(3);
    case 'g'; w = [-y-1; y-1; y(1)^2-y(2)*y(3); 
                   y(2)^2*y(3)-y(1)*x(1); -y(3)^2+0.1];
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [y(1)-x(2)*y(3)  ; y(1)^2-x(1)*y(3)];         
        case 'y' ; w = [x(1)+2*x(2)*y(1); 0; -x(1)*x(2)   ];
        case 'xx'; w = [0 -y(3); -y(3) 0];
        case 'xy'; w = [1 2*y(1); 0 0; -x(2) -x(1)];
        case 'yy'; w = [2*x(2) 0 0; 0 0 0; 0 0 0];
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [ -eye(2); eye(2); -2*x(1) 0; 0 (y(1))^2];    
        case 'y' ; w = [ zeros(4,3); 0.1*y(2) 0.1*y(1) 0 ;  2*x(2)*y(1) 0 0];
        case 'xx'; w = zeros(12,2); w(9,1) =-2;
        case 'xy'; w = zeros(18,2); w(16,2)=2*y(1);
        case 'yy'; w = zeros(18,3); w(13,2)=0.1; w(14,1)=0.1; w(16,1)=2*x(2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = [y(1)^2; y(2)*y(3)];    
        case 'y' ; w = [2*x(1)*y(1); x(2)*y(3); x(2)*y(2)];   
        case 'xx'; w = [0 0;0 0];
        case 'xy'; w = [2*y(1) 0; 0 y(3); 0 y(2)];
        case 'yy'; w = [2*x(1) 0 0; 0 0 x(2); 0 x(2) 0];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [zeros(7,2); -y(1) 0; 0 0];
        case 'y' ; w = [-eye(3); eye(3); 2*y(1) -y(3) -y(2); 
                       -x(1) 2*y(2)*y(3) y(2)^2; 0 0 -2*y(3)];            
        case 'xx'; w = zeros(18,2);  
        case 'xy'; w = [zeros(21,2); -1 0; zeros(5,2)]; 
        case 'yy'; w = [zeros(18,3); 2 0 0; 0 0 -1; 0 -1 0; 
                        0 0 0; 0 2*y(3) 2*y(2); 0 2*y(2) 0;
                        0 0 0; 0 0 0; 0 0 -2];
        end        
   end   
end

end
