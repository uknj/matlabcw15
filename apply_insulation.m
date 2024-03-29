function [M, c] = apply_insulation (A, b, ni, nj, dx, dy)
% Apply Insulation. This function applies the insulation on the bottom
% boundary.
% Where A is the current computational matrix, b is the current constant
% vector, ni and nj are the number of nodes in the x and y direction
% respectively. M is the modified matrix, c is the constant vector.

M = A;
c = b;

% To convert from row and col to node based matrix
n = ni * nj;

index = reshape(1:n, nj, ni)'; % To convert from row and col to node

for i = 1:ni
    for j = 1:nj
        C = index(i, j); % The index of the node at row i and col j
        % Need to check the values for i and j to see if they fall in the
        % bottom boundary. So if j == 1, and i not = 1 (because corner
        % point) and i not = to ni (also corner point).
        if j == 1 && i ~= 1 && i ~= ni
            W = index(i-1, j); % Values to the left, top and right (respectively) of the point. South is not needed as it is on the south boundary.
            N = index(i, j+1);
            E = index(i+1, j);
            M(C, C) = -(2 / dx^2 + 2 / dy^2);
            M(C, N) = 2 * (1 / dy^2); % 2 * because of a mirror effect that occurs on  the boundary. 
            M(C, [E, W]) = (1 / dx^2);
            c(C) = 0; % Set temperatures on the bottom boundary to equal 0.
        end
    end
end



end

