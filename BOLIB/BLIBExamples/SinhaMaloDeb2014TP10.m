function w=SinhaMaloDeb2014TP10(x,y,keyf,keyxy)
% This file provides all functions defining SinhaMaloDeb2014TP10 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [10 10 0 20]


 
if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; w = sum((x-1).^2+(y).^2);
    case 'G'; w = [];
    case 'f'; t = sqrt(1:10)'; 
              xy= x.*y;
              w = exp(1+sum(xy.*xy)/4000-prod(cos(xy./t)) );     
    case 'g'; w = [y-pi; -y-pi];  
    end    
else
    switch keyf
    case 'F'
        switch keyxy
        case 'x' ; w = 2*(x-1);         
        case 'y' ; w = 2*(y);       
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
        t  = sqrt(1:10)';
        xy = x.*y;
        yt = y./t; xt = x./t;
        xyt= xy./t;
        p  = sum(xy.*xy)/2;
        q  = -prod(cos(xyt));      
        f0 = exp(1+p/2000+q );
        px = xy.*y;              py = xy.*x;
        qx = -q*yt.*tan(xyt);    qy = -q*xt.*tan(xyt);
        switch keyxy            
        case 'x' ; w   = f0*( px/2000+qx) ;   
        case 'y' ; w   = f0*( py/2000+qy) ;                  
        case 'xx'; pq  = px/2000+qx; 
                   yt2 = yt.*tan(xyt);
                   qxx = q*( yt2*yt2'- diag( (yt.*sec(xyt)).^2 ) );
                   w   = f0*(pq*pq'+diag(y.*y/2000)+qxx);
        case 'xy'; pqx = px/2000+qx; 
                   pqy = py/2000+qy;
                   xt2 = xt.*tan(xyt);
                   yt2 = yt.*tan(xyt);
                   qxy = q*( xt2*yt2'- diag(tan(xyt)./t+ xt.*yt.*(sec(xyt).^2) ) );
                   w   = f0*(pqy*pqx'+diag(xy/1000)+qxy);                     
        case 'yy'; pq  = py/2000+qy; 
                   xt2 = xt.*tan(xyt);
                   qyy = q*( xt2*xt2'- diag( (xt.*sec(xyt)).^2 ) );
                   w   = f0*(pq*pq'+diag(x.*x/2000)+qyy);
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

