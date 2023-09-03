%% fsolve exercise 1

%% after giving this options -> fsolve won't show the solving details

% options = optimset('Display', 'none');     
% eta = fsolve(@activationoverpotential, eta0, options);

%% here without giving options : 
eta0 = 0.01;  % initial guess for eta
eta = fsolve(@activationoverpotential, eta0);

display(['activation over potential is ' num2str(eta)])

function actop = activationoverpotential(eta)
    currentdensity = 0.1; % A/m^2
    exchangecurrent = 0.001; % A/m^2
    transfercoeff_anode = 0.5;
    transfercoeff_cathode = 0.5;

    R = 8.314; % Gas Constant J/mol K
    T = 273.15; % Temperature K
    F = 96485.33289; % Faraday Constant Col/mol

    actop = exchangecurrent*(exp(transfercoeff_anode*eta*F/(R*T))-exp(-transfercoeff_cathode*eta*F/(R*T)))-currentdensity;
end