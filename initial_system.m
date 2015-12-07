function [A,b] = initial_system(ni, nj, dx, dy, T_leftright, T_top)
% Create the computational matrix A x = b using FDM (CDS)
%

% Obtain the total number of nodes by multiplying
n = ni * nj;

A = zeros(n, n);
b = zeros(n, 1);

index = reshape(1:n, nj, ni)'; % to convert from row and col to node

for i = 1:ni
    for j = 1:nj
        C = index(i, j); % the index of the node at row i and col j
        if i == 1 || i == ni
            % this is a left/right boundary node
            A(C, C) = 1;
            b(C) = T_leftright;
        elseif j == 1 || j == nj
            % this is a top/bottom boundary node
            A(C, C) = 1;
            b(C) = T_top;
        else % this is an interior node
            % indices for North, East, West and South
            N = index(i, j+1);
            S = index(i, j-1);
            E = index(i+1, j);
            W = index(i-1, j);
            A(C, C) = -2*(1 / dx^2 + 1 / dy^2);
            A(C, [N, S]) = 1 / dy^2;
            A(C, [E, W]) = 1 / dx^2;
        end
    end
end