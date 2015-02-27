function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%
temp = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
% You need to return the following variables correctly.
C = 0.3;
sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
%{
n = size(temp,1);
err_c = zeros(n,n);
err_t = zeros(n,n);
mmin=99999;
res.c=0;
res.s=0;
for i = 1:n 
   for j= 1:n
       C = temp(i);
       sigma = temp(j);
       model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
       visualizeBoundary(X, y, model);
       predictionst = svmPredict(model, X);
       predictionsc = svmPredict(model, Xval);
       err_c(i,j) = mean(double(predictionsc ~= yval));
       err_t(i,j) = mean(double(predictionst ~= y));
       if (abs(err_c(i,j) - err_t(i,j))<mmin)
           mmin = abs(err_c(i,j) - err_t(i,j));
           res.c=C;
           res.s=sigma;
       end
   end
end
mesh(temp,temp, err_c);
figure;
mesh(temp,temp, err_t);
figure;
disp(mmin);
disp(res);
C = res.c;
sigma = res.s;
%}
% =========================================================================

end
