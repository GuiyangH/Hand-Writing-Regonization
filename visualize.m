function [] = visualize(X)
%Input a matrix X, display it nicely as 2D picture.


[m n] = size(X);

%Set background dimension
width = round(sqrt(size(X, 2)));
height = (n / width);

% Set display to gray
colormap(gray);


% Compute number of items to display
num_rows = floor(sqrt(m));
num_cols = ceil(m / num_rows);

% Image paddings
pad = 1;

% Initial value setup
display_array = - ones(pad + num_rows * (height + pad), pad + num_cols * (width + pad));
current_img_index = 1;

% Reccuresively display images
for j = 1:num_rows
	for i = 1:num_cols
		if current_img_index > m, 
			break; 
        end
		% Get the max value of the patch
		max_val = max(abs(X(current_img_index, :)));
		display_array(pad + (j - 1) * (height + pad) + (1:height),pad + (i - 1) * (width + pad) + (1:width)) = ...
						reshape(X(current_img_index, :), height, width) / max_val;
		current_img_index = current_img_index + 1;
    end
end

% Display Image
h = imagesc(display_array, [-1 1]);
drawnow;
end
