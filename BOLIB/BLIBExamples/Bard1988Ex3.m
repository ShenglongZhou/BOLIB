function w=Bard1988Ex3(x,y,keyf,keyxy)
% This file provides all functions defining Bard1988Ex3 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 3 4]

if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -x(1)^2-3*x(2)-4*y(1)+y(2)^2;
    case 'G'; w = [x(1)^2+2*x(2)-4; -x ];   
    case 'f'; w = 2*x(1)^2+y(1)^2-5*y(2);  
    case 'g'; w = [-x(1)^2+2*x(1)-x(2)^2 + 2*y(1)-y(2)-3; 
                   -x(2)-3*y(1)+4*y(2)+4; -y]; 
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [-2*x(1); -3    ];         
        case 'y' ; w = [-4     ; 2*y(2)];     
        case 'xx'; w = [-2 0; 0 0 ];
        case 'xy'; w = [ 0 0; 0 0 ];
        case 'yy'; w = [ 0 0; 0 2 ];
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [2*x(1) 2; -1 0; 0 -1 ];    
        case 'y' ; w = zeros(3,2);      
        case 'xx'; w = zeros(6,2); w(1,1)=2;
        case 'xy'; w = zeros(6,2);
        case 'yy'; w = zeros(6,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = [ 4*x(1);  0 ];    
        case 'y' ; w = [ 2*y(1); -5 ];      
        case 'xx'; w = [ 4 0; 0 0];
        case 'xy'; w = [ 0 0; 0 0];
        case 'yy'; w = [ 2 0; 0 0];
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [-2*x(1)+2 -2*x(2);  0 -1;  0 0; 0  0 ];
        case 'y' ; w = [ 2        -1     ; -3  4; -1 0; 0 -1 ];                
        case 'xx'; w = [-2*eye(2); zeros(6,2)];
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = zeros(8,2);
        end        
   end   
end

end


