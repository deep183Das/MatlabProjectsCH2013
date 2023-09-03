%% ProblemSheet4 _ question 1
clear;

%% globally defining the variables :
global P R T Pc Tc
P = 10*10^5; % N/m^2 => (10 * 10^5)
R = 8.314; % J/mol.K
T = 473.15; % Kelvin => (200 + 273.15)

Pc = 34*10^5; % N/m^2
Tc = 126.2; % K

%% solving for V(molar volume) using "van der Waals equation of state" : fsolve
molar_volume_initial_guess = 0.003; % m^3/mol

% using "fsolve" function 
% options = optimset('Display', 'iter-detailed');
options = optimoptions('fsolve', 'Display', 'iter');
molar_volume = fsolve(@vander, molar_volume_initial_guess, options);

disp('Using "Van Der Waals equation of state" : via fsolve method : ');
disp(['The molar volume is ' num2str(molar_volume) ' m^3/mol.']);


function Vol_per_mole = vander(V)
    global P R T Pc Tc

    % defining Van Der Waals constants "a" & "b"
    a = (27*(R^2)*(Tc^2))/(64*Pc);
    b = (R*Tc)/(8*Pc);

    % using Van Der Waals equation
    Vol_per_mole = (R*T)/(V - b) - a/(V^2) - P;
end