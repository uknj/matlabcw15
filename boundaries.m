% Set the boundary conditions for the temperature of the 4 sided object.
% Temperature values
bc = ones(1, 3);

% bc(1) = 25 - b;
% bc(2) = 40 + a;
% bc(3) = 200 + a - b;

% Validate the data input to ensure it is a positive integer. If it is
% invalid (eg. a string, or a negative number which isn't possible, reject
% and ask for values again.

inValid = true;
while inValid == true
    bc(1) = input('Enter the temperature at the left/right boundary: ');
    bc(2) = input('Enter the temperature at the top boundary: ');
    bc(3) = input('Enter the temperature hole boundary: ');
  try
    validateattributes(bc(1), {'numeric'}, ...
                       {'scalar', 'real', 'finite'})
    validateattributes(bc(2), {'numeric'}, ...
                       {'scalar', 'real', 'finite'})
    validateattributes(bc(3), {'numeric'}, ...
                       {'scalar', 'real', 'finite'})
    inValid = false;
  catch
    disp('Invalid input. Ensure that the values for the boundary temperatures are real numbers! Please re-enter: ');
  end
end

% In order to match the calls for later functions, need to assign these
% values to named variables.
T_leftright = bc(1);
T_top = bc(2);
T_hole = bc(3);