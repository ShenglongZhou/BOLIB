function w=SinhaMaloDeb2014TP8(x,y,keyf,keyxy)
% This file provides all functions defining SinhaMaloDeb2014TP8 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 5 6]


if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = ([2 2]*x+[-3 -3]*y-60)^2;
    case 'G'; w = [ -x; x-50; [1 1]*x+[1 -2]*y-40];
    case 'f'; w = sum((y-x+20).^2);     
    case 'g'; w = [2*y-x+10; y-20; -y-10]; 
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = [4;4]*([2 2]*x+[-3 -3]*y-60);          
        case 'y' ; w = [-6;-6]*([2 2]*x+[-3 -3]*y-60);  
        case 'xx'; w = 8*ones(2);
        case 'xy'; w = -12*ones(2);
        case 'yy'; w = 18*ones(2);
        end 
    case 'G'  
        switch keyxy
        case 'x' ; w = [-eye(2); eye(2); 1 1 ];
        case 'y' ; w = [zeros(4,2); 1 -2];              
        case 'xx'; w = zeros(10,2);
        case 'xy'; w = zeros(10,2);
        case 'yy'; w = zeros(10,2);
        end           
	case 'f'   
        switch keyxy
        case 'x' ; w =-2*(y-x+20);          
        case 'y' ; w = 2*(y-x+20);  
        case 'xx'; w = 2*eye(2);
        case 'xy'; w =-2*eye(2);
        case 'yy'; w = 2*eye(2);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = [-eye(2); zeros(4,2)];
        case 'y' ; w = [2*eye(2); eye(2); -eye(2)];              
        case 'xx'; w = zeros(12,2);
        case 'xy'; w = zeros(12,2);
        case 'yy'; w = zeros(12,2);
        end        
   end   
end

end




