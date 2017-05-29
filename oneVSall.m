function [thetas] = oneVSall(X, y, num_class, lambda)
%oneVSall input a multi-images matrix X, and the corresponding
%classification y, how many classification needed num_class, normalization factor lambda.
% Out putting a well trained set of parameters thetas.

% Variables 
[m, n] = size(X); 
thetas = zeros(num_class, n + 1);
X = [ones(m, 1) X]; % Due to normalization, we need add a constant.

% Use built-in function to optimize on each pair of classification.
options = optimset('GradObj', 'on', 'MaxIter', 50);
for i = 1: num_class
    thetas(i,:) = fmincg (@(t)(Cost_Gradient(t, X, (y == i), lambda)), ...
                     zeros(n, n + 1), options);
end
end
