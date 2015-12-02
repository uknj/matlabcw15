function [dx, dy, n] = grid_points(x_width, y_width, ni, nj) 
%Gridpoints: This function gives step sizes for specified conditions.
%   This function takes values for the dimensions of the square and the
%   number of the required points along the x and y axis. It returns dx and
%   dy the step sizes. It also returns n, the total number of grid points.

dx = x_width / (ni - 1);
dy = y_width / (nj - 1);
n = ni * nj;

end

