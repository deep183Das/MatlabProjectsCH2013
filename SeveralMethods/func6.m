%% fsolve exercise 2

% Defining variables globally & also within the function wherever needed to
% be identified as a global variable

global currentdensity exchangecurrent transfercoeff_anode
global transfercoeff_cathode R T F

currentdensity = 0.1; % A/m^2
exchangecurrent = 0.001; % A/m^2
transfercoeff_anode = 0.5;
transfercoeff_cathode = 0.5;

R = 8.314; % Gas Constant J/mol K
T = 273.15; % Temperature K
F = 96485.33289; % Faraday Constant Col/mol

eta0 = 0.01;
options = optimset('Display', 'none');
eta = fsolve(@activationoverpotential, eta0, options);

display(['activation over potential is ' num2str(eta)])

function actop = activationoverpotential(eta)
    global currentdensity exchangecurrent transfercoeff_anode
    global transfercoeff_cathode R T F

    actop = exchangecurrent*(exp(transfercoeff_anode*eta*F/(R*T))-exp(-transfercoeff_cathode*eta*F/(R*T)))-currentdensity;
end
