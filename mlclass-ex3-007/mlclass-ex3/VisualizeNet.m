function [ output_args ] = VisualizeNet(Layer,Theta, X, y , k , lno)
%VISUALIZENET Summary of this function goes here
%   Detailed explanation goes here
tTheta = cell(size(Layer,1)-1,1);
pos = 1;
for i = 2:size(Layer,1)
    tTheta{i-1} = reshape(Theta(pos:pos+(Layer(i)*(Layer(i-1)+1))-1),Layer(i),Layer(i-1)+1);
    pos = pos + (Layer(i)*(Layer(i-1)+1));
end 
m = size(X, 1);
num_labels = size(tTheta{size(Layer,1)-1}, 1);


%X = [ones(m, 1) X];
%a2 = sigmoid(Theta1*X');


a = cell(size(Layer,1),1);
a{1} = [ones(m, 1) X]';
for i = 2:lno
    a{i} = [ones(1,size(X,1)) ; sigmoid(tTheta{i-1}*a{i-1})];
end

tt= a{lno}(2:end,:)';
res = [];
tem = 1:m;
for i=1:num_labels
    p = tem(y==i);
    res = [res p(randperm(size(p,2),k))];
end
displayData(tt(res,:));

end

