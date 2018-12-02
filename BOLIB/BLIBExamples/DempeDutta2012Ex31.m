function w=DempeDutta2012Ex31(x,y,keyf,keyxy)
% This file provides all functions defining DempeDutta2012Ex31 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 4 2]

 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -y(2);
    case 'G'; w = [-x; y(1)*y(2); -y(1)*y(2)]; 
    case 'f'; w = sum((y+[0;1]).^2);      
    case 'g'; w = [(y(1)-x(1))^2+(y(2)-x(1)-1)^2-1; (y(1)+x(2))^2+(y(2)-x(2)-1)^2-1];  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [0;0];         
        case 'y' ; w = [0;-1];        
        case 'xx'; w = zeros(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = zeros(2);
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [-eye(2);0 0; 0 0];    
        case 'y' ; w = [zeros(2);  y(2) y(1);  -y(2) -y(1)];      
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = [zeros(4,2); 0 1; 1 0; 0 -1; -1 0 ];
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = [0;0];    
        case 'y' ; w = 2*(y+[0;1]);          
        case 'xx'; w = zeros(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = 2*eye(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w =[-2*(y(1)-x(1))-2*(y(2)-x(1)-1) 0; 
                       0 2*(y(1)+x(2))-2*(y(2)-x(2)-1)];
        case 'y' ; w = [2*(y(1)-x(1)) 2*(y(2)-x(1)-1); 
                        2*(y(1)+x(2)) 2*(y(2)-x(2)-1)];              
        case 'xx'; w = [4 0; 0 0; 0 0; 0 4];
        case 'xy'; w = [-2 0; -2 0; 0 2; 0 -2];
        case 'yy'; w = [2 0; 0 2; 2 0; 0 2];
        end        
   end   
end

end



