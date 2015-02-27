function res = transformY( y , num_labels )
%TRANSFORMY Summary of this function goes here
%   Detailed explanation goes here
n = size(y,1);
res = zeros(n,num_labels);

c = 1:n:(n*num_labels);
t = c(y) + ( 0:n-1);

res(t) = 1;

end

