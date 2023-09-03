%% ProblemSheet4 _ question 1
clear;

%% globally defining the variables :
global P R T Pc Tc
P = 10*10^5; % N/m^2 => (10 * 10^5)
R = 8.314; % J/mol.K
T = 473.15; % Kelvin => (200 + 273.15)

Pc = 34*10^5; % N/m^2
Tc = 126.2; % K

%% solving for V(molar volume) using "Redlich-Kwong equation of state" : fsolve
molar_volume_initial_guess = 0.003; % m^3/mol

% using "fsolve" function 
options = optimset('Display', 'iter-detailed');
molar_volume = fsolve(@vander, molar_volume_initial_guess, options);

disp('Using "Redlich-Kwong equation of state" : via fsolve method : ');
disp(['The molar volume is ' num2str(molar_volume) ' m^3/mol.']);

function Vol_per_mole = vander(V)
    global P R T Pc Tc

    % defining Van Der Waals constants "a" & "b"
    a = (0.4278*(R^2)*(Tc^2))/Pc;
    b = (0.0867*R*Tc)/Pc;

    % using Van Der Waals equation
    Vol_per_mole = (R*T)/(V - b) - a/(V*((V + b)^2)*(T^(0.5))) - P;
end