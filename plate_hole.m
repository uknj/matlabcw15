clear all; close all; clc;

run('case_setup') % Run the case setup script.

% Run the grid_points script to obtain values for dx, dy and n.
[dx, dy, n] = grid_points(x_width, y_width, ni, nj);

run('boundaries') % Run the boundaries script

% Setup the initial System.
[A,b] = initial_system(ni, nj, dx, dy, T_leftright, T_top);

% Apply the temperature at the hole to the initial system.
[A, b] = apply_hole(A,b,x_width,y_width,ni,nj,x_hole,y_hole,dim_h,T_hole);

% Apply the insulated boundary on the bottom of the system.
[A, b] = apply_insulation (A, b, ni, nj, dx, dy);

% Calculate the solution of M * x = c by dividing using Matlab's inbuilt
% capabilities.
x = A\b;

T = reshape(x, nj, ni)'; % reshape for plotting
X = linspace(0, x_width, ni); % to convert from grid column to x
Y = linspace(0, y_width, nj); % to convert from grid row to y
hp = contourf(X,Y,T'); % create plot
title('Temperatures on a thin plate');
xlabel('x [cm]');
ylabel('y [cm]');
hc = colorbar;
title(hc, 'T [{\circ}C]');