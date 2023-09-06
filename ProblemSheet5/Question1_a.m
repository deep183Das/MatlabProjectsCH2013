%% PS5 Question 1_a

% given vectors : k0 & Eact
k0 = [0.001, 0.34];
Eact = [12000, 5600];

%% creating a structure array 

% defining field names as 'pre_exponential_factor' and 'activation_energy' 
% method-1
reactiondata = struct('pre_exponential_factor', k0, 'activation_energy', Eact);

% method-2 
reactiondata.pre_exponential_factor = k0;
reactiondata.activation_energy = Eact;
