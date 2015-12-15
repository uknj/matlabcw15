% Set the boundary conditions for the temperature of the 4 sided object.
% Temperature values
boundary_conditions = ones(1, 4);

% bc(1) = 25 - b;
% bc(2) = 40 + a;
% bc(3) = 200 + a - b;

% Validate the data input to ensure it is a positive integer. If it is
% invalid (eg. a string, or a negative number which isn't possible, reject
% and ask for values again.

inValid = true;
while inValid == true
    boundary_conditions(1) = input('Enter the temperature at the left/right boundary: ');
    boundary_conditions(2) = input('Enter the temperature at the top boundary: ');
    boundary_conditions(3) = input('Enter the temperature hole boundary: ');
    boundary_conditions(4) = input('Enter the maximum temperature of the plate: ');
  try
    validateattributes(boundary_conditions(1), {'numeric'}, {'scalar', 'real', 'finite'})
    validateattributes(boundary_conditions(2), {'numeric'}, {'scalar', 'real', 'finite'})
    validateattributes(boundary_conditions(3), {'numeric'}, {'scalar', 'real', 'finite'})
    validateattributes(boundary_conditions(4), {'numeric'}, {'scalar', 'real', 'finite'})
    inValid = false;
  catch
    disp('Invalid input. Ensure that the values for the boundary temperatures are real numbers! Please re-enter: ');
  end
end

% In order to match the calls for later functions, need to assign these
% values to named variables.
T_leftright = boundary_conditions(1);
T_top = boundary_conditions(2);
T_hole = boundary_conditions(3);
T_max = boundary_conditions(4);