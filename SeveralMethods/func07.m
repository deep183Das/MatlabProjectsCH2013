%% fsolve exercise 3
% in the following a range of values are calculated using fsolve

global currentdensity exchangecurrent transfercoeff_anode
global transfercoeff_cathode R T F

exchangecurrent = 0.001; % A/m^2
transfercoeff_anode = 0.5;
transfercoeff_cathode = 0.5;

R = 8.314; % Gas Constant J/mol K
T = 273.15; % Temperature K
F = 96485.33289; % Faraday Constant Col/mol

eta0 = 0.01;    % Initial guess value for eta

j = 1; % for array updation
for currentdensity = 0.01 : 0.01 : 0.1
    eta(j) = fsolve(@activationoverpotential, eta0);
    j=j+1;
end

display(['activation over potential is ' num2str(eta)])

function actop = activationoverpotential(eta)
    global currentdensity exchangecurrent transfercoeff_anode
    global transfercoeff_cathode R T F

    actop = exchangecurrent*(exp(transfercoeff_anode*eta*F/(R*T))-exp(-transfercoeff_cathode*eta*F/(R*T)))-currentdensity;
end
