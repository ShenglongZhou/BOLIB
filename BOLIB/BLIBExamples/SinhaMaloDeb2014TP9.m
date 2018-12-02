function w=SinhaMaloDeb2014TP9(x,y,keyf,keyxy)
% This file provides all functions defining SinhaMaloDeb2014TP9 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [10 10 0 20]

 
 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = sum((x-1).^2+y.^2);
    case 'G'; w = [];
    case 'f'; t = sqrt(1:10)'; w = exp( (1+sum(y.^2)/4000-prod(cos(y./t)))*sum(x.^2) );        
    case 'g'; w = [y-pi; -y-pi];    
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*x-2;         
        case 'y' ; w = 2*y;        
        case 'xx'; w = 2*eye(10);
        case 'xy'; w = zeros(10,10);
        case 'yy'; w = 2*eye(10);
        end 
    case 'G'  
        switch keyxy            
        case 'x' ; w = [];    
        case 'y' ; w = [];         
        case 'xx'; w = [];
        case 'xy'; w = [];
        case 'yy'; w = [];
        end           
	case 'f'         
        t = sqrt(1:10)'; 
        yt= y./t;
        pt= prod(cos(yt));
        a = 1+sum(y.^2)/4000-pt; 
        x2= sum(x.^2);
        f0= exp(a*x2);  
        switch keyxy
        case 'x' ; w = (2*a*f0)*x;    
        case 'y' ; w = (x2*f0)*(y/2000+pt*tan(yt)./t);          
        case 'xx'; w = (2*a*f0)*((2*a)*x*x'+eye(10));
        case 'xy'; ay= y/2000+pt*tan(yt)./t;
                   fy= x2*f0*ay; 
                   w = (2*(fy*a+f0*ay))*x';
        case 'yy'; tt= tan(yt)./t;
                   T =-(pt*tt)*tt'+ pt*diag( ( sec(yt)./t).^2 );
                   ay= y/2000+pt*tt;  
                   w = ((x2^2*f0)*ay)*ay'+x2*f0*(eye(10)/2000+T);
        end           
	case 'g'   
        switch keyxy
        case 'x' ; w = zeros(20, 10);
        case 'y' ; w = [eye(10); -eye(10)];            
        case 'xx'; w = zeros(200,10);
        case 'xy'; w = zeros(200,10);
        case 'yy'; w = zeros(200,10);
        end        
   end   
end
end


