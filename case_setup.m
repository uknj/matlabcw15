close all; clear all; clc;

% URN variables
a = 1;
b = 1;

% Dimensions, units in cm
xtotal = 21 + b + 8 + (b/10) + 21;
ytotal = 11 + a + 8 + (b/10) + 11;

% Initial nodal values for the x-axis and y-axis respectively
ni = str2num('0');
nj = str2num('0');

if ni == 0;
    ni = input('Please input the number of i nodes (x-axis nodes) you require:');
end

if nj == 0;
    nj = input('Please input the number of j nodes (y-axis nodes) you require:');
end

