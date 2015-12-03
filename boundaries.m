clear all; close all; clc;

% Set the boundary conditions for the temperature of the 4 sided object.

% URN variables
a = 1;
b = 1;

% Temperature values
bc = ones(1, 3);

bc(1) = 25 - b;
bc(2) = 40 + a;
bc(3) = 200 + a - b;
