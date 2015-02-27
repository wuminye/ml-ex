function p = predict(Theta, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)
tTheta = cell(size(Layer,1)-1,1);
pos = 1;
top = size(Layer,1);
for i = 2:size(Layer,1)
    tTheta{i-1} = reshape(Theta(pos:pos+(Layer(i)*(Layer(i-1)+1))-1),Layer(i),Layer(i-1)+1);
    pos = pos + (Layer(i)*(Layer(i-1)+1));
end 
% Useful values
m = size(X, 1);
num_labels = size(tTheta{size(Layer,1)-1}, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%


a = cell(size(Layer,1),1);
a{1} = [ones(m, 1) X]';
for i = 2:size(Layer,1)
    a{i} = [ones(1,size(X,1)) ; sigmoid(tTheta{i-1}*a{i-1})];
end
ans = a{top}(2:end,:);

[Y,p]=max(ans', [], 2);




% =========================================================================


end
