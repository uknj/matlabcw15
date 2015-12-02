clear all; close all; clc;

%Initialise the calculations and variables.

% URN variables
a = 1;
b = 1;

% Dimensions of overall plate, units in cm
x_width = 21 + b + 8 + (b/10) + 21;
y_width = 11 + a + 8 + (b/10) + 11;

% Dimensions of square hole
sq_blc = [21 + b, 11 + a];      % Co-ordinates of bottom left corner of square
sq_trc = [21 + b + 8 + (b/10), 11 + a + 8 + (b/10)];  % Co-ordinates of top right corner of square
hole_length = 8.1;      % cm
hole_width = 8.1;       % cm

% Initial nodal values for the x-axis and y-axis respectively
ni = 0;
nj = 0;

% Validate the data input to ensure it is a positive integer.
inValid = true;
while inValid == true
    ni = input('Enter the number of i nodes (x-axis nodes) you require: ');
    nj = input('Enter the number of j nodes (y-axis nodes) you require: ');
  try
    validateattributes(nj, {'numeric'}, ...
                       {'scalar', 'integer', 'real', 'finite', 'positive'})
    validateattributes(ni, {'numeric'}, ...
                       {'scalar', 'integer', 'real', 'finite', 'positive'})
    inValid = false;
  catch
    disp('Invalid input. Ensure that the values for ni and nj are positive integers! Please re-enter: ');
  end
end