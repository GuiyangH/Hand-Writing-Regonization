%% Handwritting Regonization
%-----------------------------------
%          Introduction
% Method: One-versus-all classification
% Success rate: 95% (sample from UCI)
%-----------------------------------
%            Files
% Cost_Gradient.m  functions to compute the cost and gradient at each iteration
% numberdata.mat   a sample data from UCI	
% oneVSall.m	   use fminc to optimize the parameters
% visualize.m      visualize the datas into 2D picture.
%-----------------------------------
%% Initialize
clc; close all; clear

num_class = 10; %There are 10 numbers to distinct.
image_size = 400; % The input images are 20x20 pictures.

%% ==============Inport Data and Display them============================
fprintf('Importing Data and Display them ... \n')

%ask for datas.
prompt = 'What is the file name? \n file form \n (X,y): X(matrix): different samples x 400 numbers representing a sample \n Press Y to use default'; 
x = input(prompt);
if x == 'Y'
    load('numberdata.mat'); %training data from UCI
else
    load(x)
end
m = size(X,1);

% Randomly select some data to display
subset = randi([1,m],1,64);

visualize(X(subset,:));

fprintf('Press anykey to process to training process. \n');
pause;

%% ============== Implement Logistic Regression===========================
fprintf('Training Logistic Regression ... \n');

lambda = 0.1; % The normalization factor. It is tested to be somehow optimal.

[thetas] = oneVSall(X,y,lambda,num_class); 

%% ============== Accuracy Computation using the same set=================

X = [ones(m, 1) X];
predict = X*thetas';
[dummy_var,p] = max(predict,[],2);

fprintf('Training Set Accuracy: %f\n',mean(p == y)*100);
