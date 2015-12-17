clear all; close all; clc;

run('case_setup') % Run the case setup script.

% Run the grid_points script to obtain values for dx, dy and n.
[dx, dy, n] = grid_points(x_width, y_width, ni, nj);

run('boundaries_evolving') % Run the boundaries script
T_start = 0; % Initial temperature set at 0 as required. Units = degrees C.
% T_max is used to Calculate until t = t_max [s]

a = 0.835; % Thermal diffusivity, units = cm^2/s

dtstable = (1/8) * ((dx^2) + (dy^2))/a; %dt must always be less than or equal.

% Validate the data input for 'dt' to ensure it is a positive integer. If it is
% invalid (eg. a string, or a negative number which isn't possible, reject
% and ask for values again.
% Initial value for dt.
dt = 0;

inValid = true;
while inValid == true || dt >= dtstable
    dt = input(['Please enter a value for dt that is a +ve number less than or equal to ', num2str(dtstable),': ']);
  try
    validateattributes(dt, {'numeric'}, {'scalar', 'real', 'finite', 'positive'})
    inValid = false;
  catch
    disp(['Invalid input. Ensure that the value for dt is a +ve number less than or equal to ', num2str(dtstable),'! Please re-enter: ']);
  end
end

t = 0 : dt : T_max;
nn = size(t,2); % number of time steps

% Initialize the matrix now. Needs to be a 3-D matrix for the time
% component. ni and nj dimensions like in 2d, nn dimension for each
% timestep.
T = zeros(ni, nj, nn);

% Set the temperatures on the boundaries at all values for nn.
T(1, : , :) = T_leftright; % Set the left boundary temperature.
T(ni, :, :) = T_leftright; % Set the right boundary temperature.
T(:, nj, :) = T_top; % Set the top boundary temperature.

% Set the temperature of the other points to T_start
T(2:(ni - 1), 2:(nj - 1), :) = T_start;

% Set the temperature of the hole to T_hole.
hx1 = floor((x_hole + 1)/dx);
hx2 = ceil((x_hole + 1 + dim_h)/dx);
hx3 = floor((y_hole + 1)/dy);
hx4 = ceil((y_hole + 1 + dim_h)/dy);

T(hx1:hx2, hx3:hx4, :) = T_hole;

% % Now apply the derived equation
% for n = 1:(nn - 1)
%     for i = 1:(ni - 1)
%         for j = 1:(nj - 1)
%             

% Didnt get this to work :(...