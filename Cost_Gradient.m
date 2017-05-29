function [J, grad] = Cost_Gradient(theta, X, y, lambda)
%This function intake (X,y), given parameters theta, and a normalization factor lambda
% Compute the Cost and the gradient at this stage.

%Some Variables
m = length(y); 
J = 0;
grad = zeros(size(theta));


temp = theta;
temp(1) = 0;
g = 1./(1.+ exp(-X*theta));

J = 1/m*(-y'*log(g)-(1.-y')*log(1.-g))+lambda/(2*m)*sum(temp.^2);
grad = 1/m*X'*(g-y)+lambda/m*temp;
grad = grad(:);

end
