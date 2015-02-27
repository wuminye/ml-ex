%% Machine Learning Online Class - Exercise 3 | Part 2: Neural Networks

%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear exercise. You will need to complete the following functions 
%  in this exericse:
%
%     lrCostFunction.m (logistic regression cost function)
%     oneVsAll.m
%     predictOneVsAll.m
%     predict.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset. 
%  You will be working with a dataset that contains handwritten digits.
%

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

load('ex3data1.mat');
m = size(X, 1);

% Randomly select 100 data points to display
sel = randperm(size(X, 1));
sel = sel(1:100);

displayData(X(sel, :));

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 2: Loading Pameters ================
% In this part of the exercise, we load some pre-initialized 
% neural network parameters.

fprintf('\nLoading Saved Neural Network Parameters ...\n')
Layer = [400 25 10]';
initn = 0;
for i=2:size(Layer,1)
    initn = initn + (Layer(i-1)+1)*Layer(i);
end
% Load the weights into variables Theta1 and Theta2
load('ex3weights.mat');
lambda = 0.01;
%initial_theta = [Theta1(:);Theta2(:)];
initial_theta = rand(initn,1);
gradcheck( initial_theta,X,y,lambda,1e-6 ,Layer);
theta = initial_theta;
[J, grad]=CostFunction(initial_theta,X,y,lambda,Layer);
disp(J);

%{
 options = optimset('GradObj', 'on', 'MaxIter', 20);
 [theta] = ...
        fmincg (@(t)(CostFunction(t, X, y, lambda)), ...
                 initial_theta, options);
%}
[theta] = Grandesc(theta,X,y,lambda ,1200,1.3,Layer);


%% ================= Part 3: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

VisualizeNet(theta, X,y,10);

pred = predict(theta, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

fprintf('Program paused. Press enter to continue.\n');
%pause;

%  To give you an idea of the network's output, you can also run
%  through the examples one at the a time to see what it is predicting.

%{
%  Randomly permute examples
rp = randperm(m);

for i = 1:m
    % Display 
    close all;
    fprintf('\nDisplaying Example Image\n');
    displayData(X(rp(i), :));
    figure;
    displayData(sigmoid(Theta1*[1 X(rp(i), :)]')');
    pred = predict(Theta1, Theta2, X(rp(i),:));
    if pred==y(rp(i))
       
        disp('error');
         continue;
    end
    fprintf('\nNeural Network Prediction: %d (digit %d)\n',  pred,y(rp(i)));
    
    % Pause
    
    fprintf('Program paused. Press enter to continue.\n');
    pause;
end
%}
