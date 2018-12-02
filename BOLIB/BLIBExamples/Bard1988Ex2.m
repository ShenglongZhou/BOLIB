function w=Bard1988Ex2(x,y,keyf,keyxy)
% This file provides all functions defining Bard1988Ex2 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [4 4 9 12]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; a = [1 0 1 0]; b=[0 1 0 1];
              w = -(200-a*y)*(a*y)-(160-b*y)*(b*y);
    case 'G'; w = [sum(x)-40; x-[10 5 15 20]';-x ];   
    case 'f'; w = sum((y-[4 13 35 2]').^2);  
    case 'g'; A = [0.4 0.7 0 0; 0.6 0.3 0 0;0 0 0.4 0.7; 0 0 0.6 0.3];
              w = [A*y-x; y-[20 20 40 40]'; -y]; 
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = zeros(4,1);         
        case 'y' ; a = [1 0 1 0]; b=[0 1 0 1]; 
                   w = -(200-2*a*y)*(a')-(160-2*b*y)*(b');     
        case 'xx'; w = zeros(4); 
        case 'xy'; w = zeros(4); 
        case 'yy'; w = -[-2 0 -2 0; 0 -2 0 -2; -2 0 -2 0; 0 -2 0 -2];
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [1 1 1 1; eye(4); -eye(4)];    
        case 'y' ; w = zeros(9,4);     
        case 'xx'; w = zeros(36,4);
        case 'xy'; w = zeros(36,4);
        case 'yy'; w = zeros(36,4);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = zeros(4,1);    
        case 'y' ; w = 2*(y-[4 13 35 2]');      
        case 'xx'; w = zeros(4); 
        case 'xy'; w = zeros(4); 
        case 'yy'; w = 2*eye(4);
        end           
	case 'g'         
        switch keyxy
        case 'x' ; w = [-eye(4); zeros(8,4)];
        case 'y' ; A = [0.4 0.7 0 0; 0.6 0.3 0 0;0 0 0.4 0.7; 0 0 0.6 0.3];
                   w = [A; eye(4);-eye(4)];                
        case 'xx'; w = zeros(48,4);
        case 'xy'; w = zeros(48,4);
        case 'yy'; w = zeros(48,4);
        end        
   end   
end

end


