clear all; close all; clc;

run('case_setup') % Run the case setup script.

% Run the grid_points script to obtain values for dx, dy and n.
[dx, dy, n] = grid_points(x_width, y_width, ni, nj);

run('boundaries') % Run the boundaries script

% Setup the initial System.
[A, b] = initial_system(ni, nj, dx, dy, T_leftright, T_top);

% Apply the temperature at the hole to the initial system.
[A, b] = apply_hole(A,b,x_width,y_width,ni,nj,x_hole,y_hole,dim_h,T_hole);

% Apply the insulated boundary on the bottom of the system.
[A, b] = apply_insulation (A, b, ni, nj, dx, dy);

% Calculate the solution of M * x = c by dividing using Matlab's inbuilt
% capabilities.
x = A\b;


% Time to plot the contour:
T = reshape(x, nj, ni)'; % Reshape the values for plotting

Y = linspace(0, y_width, nj); % Set the y_width as the y-axis
X = linspace(0, x_width, ni); % Set the x_width as the x-axis

temps = contourf(X,Y,T'); % Create plot of temperatures
title('Temperatures'); % Title of the plot
xlabel('x [cm]'); % X axis labelling
ylabel('y [cm]'); % Y axis labelling
temps = colorbar; % Adding a colourbar
title(temps, 'T [{\circ}C]'); % Adding a title to the colourbar