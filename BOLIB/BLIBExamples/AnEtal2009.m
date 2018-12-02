function w=AnEtal2009(x,y,keyf,keyxy)
% This file provides all functions defining AnEtal2009 problem 
% and their first and second order derivatives.
% [dim_x dim_y dim_G dim_g] = [2 2 6 4]

if nargin<4 || isempty(keyxy)
    switch keyf
    case 'F'; [H,c] = data();
               w    = [x' y']*(H*[x; y]/2+c);
    case 'G'; [~,~,A,B,d]=data(); 
               w    = [-x;-y;A*x+B*y+d];      
    case 'f'; [~,~,~,~,~,P,Q,q]=data(); 
               w    = y'*(P*x+q)+y'*Q*y/2; 
    case 'g'; [~,~,~,~,~,~,~,~,D,E,b]=data(); 
               w    = D*x+E*y+b;
    end    
else
    switch keyf
    case 'F'
        [H,c]= data(); 
        z    = H*[x; y]+c;
        switch keyxy
        case 'x' ; w = z(1:2,:);        
        case 'y' ; w = z(3:4,:);       
        case 'xx'; w = H(1:2,1:2);
        case 'xy'; w = H(3:4,1:2);
        case 'yy'; w = H(3:4,3:4);
        end 
    case 'G' 
        [~,~,A,B]=data();
        switch keyxy
        case 'x' ; w = [-eye(2);zeros(2);A];    
        case 'y' ; w = [zeros(2);-eye(2);B];       
        case 'xx'; w = zeros(12,2);
        case 'xy'; w = zeros(12,2);
        case 'yy'; w = zeros(12,2);
        end           
	case 'f'   
        [~,~,~,~,~,P,Q,q]=data();   
        switch keyxy
        case 'x' ; w = P'*y;    
        case 'y' ; w = P*x+q+(Q+Q')*(y/2);         
        case 'xx'; w = zeros(2);
        case 'xy'; w = P;
        case 'yy'; w = (Q+Q')/2;
        end           
	case 'g' 
        [~,~,~,~,~,~,~,~,D,E]=data();
        switch keyxy
        case 'x' ; w = D;
        case 'y' ; w = E;             
        case 'xx'; w = zeros(8,2);
        case 'xy'; w = zeros(8,2);
        case 'yy'; w = zeros(8,2);
        end        
   end   
end

end

function [H,c,A,B,d,P,Q,q,D,E,b]=data()
H=[-3.8  4.4  1.2 -2.2;  4.4 -2.2  0.6  1.8;
    1.2  0.6  0.0  0.4; -2.2  1.8  0.4  0.0];
c =[935.74474; 87.53654; 121.96196; 299.24825];
A=[0.00000 3.88889;-2.00000 8.77778];
B=[4.88889 7.44444; -5.11111 0.88889];
d=[-61.57778; -0.80000];
P=[-17.85000 6.57500; 30.32500 30.32500];
Q=[21.10204,11.81633;11.81633,-14.44898];
q=[-18.21053;13.05263];
D=[5.00000  7.44444; -8.33333 3.00000;
  -8.66667 -8.55556;  6.44444 -5.11111];
E=[3.88889  1.77778; 6.88889 6.11111;
  -5.33333 -7.00000; 1.44444 4.44444];
b=[-39.62222;-60.00000;72.37778;-17.28889];
end
