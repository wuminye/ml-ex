function [ theta ] = Grandesc(theta,X,y,lambda , step,ng ,Layer )
%GRANDESC Summary of this function goes here
%   Detailed explanation goes here
for i = 1:step
    if mod(i,300)==0
        ng=ng/2;
    end
    [J, grad]=CostFunction(theta,X,y,lambda,Layer);
    
    theta = theta - ng*grad;
    

    
    
    VisualizeNet(Layer,theta, X,y,10 ,2);
    [J, grad]=CostFunction(theta,X,y,lambda,Layer);
    fprintf('Iter.%d ;Training J: %f\n', i,J);
   % pause;
end

