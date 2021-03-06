function err = gradcheck( theta,X,y,lambda,eps ,Layer)
%GRADCHECK Summary of this function goes here
%   Detailed explanation goes here
[J, grad]=CostFunction(theta,X,y,lambda,Layer);

n = size(grad,1);
err = zeros(n,1);
for i = 1: n
    if mod(i,1000)==0
        disp(i);
    end
    tem = theta;
    theta(i)= theta(i)+eps;
    [J1, grad1]=CostFunction(theta,X,y,lambda,Layer);
    theta(i)= theta(i)-2*eps;
    [J2, grad2]=CostFunction(theta,X,y,lambda,Layer);

    err(i)= abs((J1-J2)/(2*eps)-grad(i));
    if err(i)>=1e-1 
        disp(err(i));
    end;
    theta = tem;
end


end

