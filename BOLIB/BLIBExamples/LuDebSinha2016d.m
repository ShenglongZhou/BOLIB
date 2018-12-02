function w=LuDebSinha2016d(x,y,keyf,keyxy)
% This file provides all functions defining LuDebSinha2016d problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 11 3]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = -x(2);
    case 'G'; y1= y(1)/14+16/7;
              w = [-[4;100]-x; x-[10;200]; -[4;100]-y; y-[10;200];
                   -y1*(x(1)-2)^2+x(2); 12.5*y1*(x(1)-5)-x(2);
                   -5*(x(1)+4-y1)*(x(1)+8-y1)+x(2)];
    case 'f'; w = -y(2); 
    case 'g'; x1= x(1)/14+16/7;
              w = [-x1*(y(1)-2)^2+y(2); 12.5*x1*(y(1)-5)-y(2);
                   -5*(y(1)+4-x1)*(y(1)+8-x1)+y(2)];  
    end    
else
    switch keyf        
    case 'F'
        switch keyxy
        case 'x' ; w = [0;-1];         
        case 'y' ; w = [0;0];    
        case 'xx'; w = zeros(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = zeros(2);
        end 
    case 'G' 
        y1= y(1)/14+16/7;
        switch keyxy            
        case 'x' ; w = [-eye(2);eye(2);zeros(4,2);-2*y1*(x(1)-2) 1;12.5*y1 -1; -10*x(1)-60+10*y1 1];    
        case 'y' ; w = [zeros(4,2);-eye(2);eye(2);-(x(1)-2)^2/14 0; 12.5*(x(1)-5)/14 0; (10*x(1)+60-10*y1)/14 0];       
        case 'xx'; w = [zeros(16,2);-2*y1 0; 0 0; zeros(2,2);-10 0; 0 0];
        case 'xy'; w = [zeros(16,2);(2-x(1))/7 0; 0 0; 12.5/14 0; 0 0; 10/14 0; 0 0];
        case 'yy'; w = [zeros(20,2);-5/98 0; 0 0];
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w = [0;0];          
        case 'y' ; w = [0;-1];    
        case 'xx'; w = zeros(2);
        case 'xy'; w = zeros(2);
        case 'yy'; w = zeros(2);
        end           
	case 'g'   
        x1= x(1)/14+16/7;
        switch keyxy            
        case 'x' ; w = [-(y(1)-2)^2/14 0; 12.5*(y(1)-5)/14 0; (10*y(1)+60-10*x1)/14 0];    
        case 'y' ; w = [-2*x1*(y(1)-2) 1;12.5*x1 -1; -10*y(1)-60+10*x1 1];       
        case 'xx'; w = [zeros(4,2); -5/98 0; 0 0];
        case 'xy'; w = [(2-y(1))/7 0; 0 0; 12.5/14 0; 0 0; 10/14 0; 0 0];
        case 'yy'; w = [-2*x1 0; 0 0; zeros(2,2);-10 0; 0 0];
        end              
   end   
end
end


