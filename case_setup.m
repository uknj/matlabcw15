%Initialise the calculations and variables.

% URN variables
a = 1;
b = 1;

% Dimensions of overall plate, units in cm
x_width = 21 + b + 8 + (b/10) + 21;
y_width = 11 + a + 8 + (b/10) + 11;

% Dimensions of square hole
x_hole = 21 + b; % Lower left corner of hole x-value
y_hole = 11 + a; % Lower left corner of hole y-value
dim_h = 8.1; % cm

% Initial nodal values for the x-axis and y-axis respectively
ni = 0;
nj = 0;

% Validate the data input to ensure it is a positive integer. If it is
% invalid (eg. a string, or a negative number which isn't possible, reject
% and ask for values again.

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