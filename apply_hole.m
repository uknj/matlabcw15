function [M, c] = apply_hole(A,b,x_width,y_width,ni,nj,x_hole,y_hole,dim_h,T_hole)
% Apply Hole
% Apply the hole temperature values to the matrix.
% Where:
% A is the initial matrix. b is the initial constant matrix. x_width and
% y_width are the plate dimensions in x and y respectively. ni and nj are
% the number of grid points in the x and y direction respectively.
% x_hole and y_hole are the co-ordinates of the 


M = A;
c = b;
% M * x = c similar to A * x = b

% Use the previous grid_points.m function to get dx, dy and n.
[dx, dy, n] = grid_points(x_width, y_width, ni, nj);

% Convert from row and col to node based matrix
index = reshape(1:n, nj, ni)';

for i = 1:ni
    for j = 1:nj
       C = index(i, j); % The index of the node at row i and col j
       % If statement checking whether the nodes are in the region of the
       % hole points:
       % if (x nodes >= x hole and <= x hole + dim) and (y nodes >= y
       % hole and <= y hole + dim)
       if (x_hole <= i * dx <= x_hole + dim_h) && (y_hole <= j * dy <= y_hole + dim_h)
           M(C, :) = 0;
           M(C, C) = 1; % Set the matrix at C,C as one, and the rest of the row as 0.
           c(C) = T_hole; % Set the b matrix to the temperature of the hole.
       end
    end
end