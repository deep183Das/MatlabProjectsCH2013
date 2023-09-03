%% ProblemSheet4 _ question 1
clear;
close all;

%% globally defining the variables :
global P R T Pc Tc
P = 10*10^5; % N/m^2 => (10 * 10^5)
R = 8.314; % J/mol.K
T = 473.15; % Kelvin => (200 + 273.15)

Pc = 34*10^5; % N/m^2
Tc = 126.2; % K

%% 1.1>> solving for V(molar volume) using "Van Der Waals equation of state" : fsolve method
molar_volume_initial_guess_VanDer_fsolve = 0.003; % m^3/mol

% using "fsolve" function 
options1 = optimset('Display', 'iter-detailed');
% options = optimoptions('fsolve', 'Display', 'iter');
disp('Iteration details for "Van Der Waals equation" : fsolve method :');
molar_volume_VanDer_fsolve = fsolve(@vanderFsolve, molar_volume_initial_guess_VanDer_fsolve, options1);

% ---------------------------------------------------------------------- %

%% 1.2>> solving for V(molar volume) using "Van Der Waals equation of state" : Newton-Raphson method
% defining Van Der Waals constants "a" & "b"
a_VanDer = (27*(R^2)*(Tc^2))/(64*Pc);
b_VanDer = (R*Tc)/(8*Pc);

% initial guess value 
molar_volume_VanDer_0 = 0.005; % m^3/mol
ea_VanDer = 100;

tol_VanDer = 10^-4; % tolerance value
max_iterations_VanDer = 100;
iter_VanDer = 0;

while(iter_VanDer <= max_iterations_VanDer)
    iter_VanDer = iter_VanDer + 1;

    molar_volume_VanDer = molar_volume_VanDer_0;
    % applying Newton-Raphson Method
    func_VanDer = (R*T)/(molar_volume_VanDer - b_VanDer) - a_VanDer/(molar_volume_VanDer^2) - P;
    func_derivative_VanDer = -(R*T)/((molar_volume_VanDer - b_VanDer)^2) + (2*a_VanDer)/(molar_volume_VanDer^3);
    
    molar_volume_VanDer_0 = molar_volume_VanDer - (func_VanDer/func_derivative_VanDer);
    ea_VanDer = abs((molar_volume_VanDer_0 - molar_volume_VanDer)/(molar_volume_VanDer));
    array1(iter_VanDer) = ea_VanDer;

    if(ea_VanDer < tol_VanDer || iter_VanDer == max_iterations_VanDer)
        break;
    end
end

size_VanDer_iter = size(array1);

% Plot for the relative error vs iterations
subplot(3,1,1);
x_VanDer = 1:size_VanDer_iter(2);
y_VanDer = array1.*100;     % converting relative error to % error

plot(x_VanDer,y_VanDer,LineStyle="-",Color='b',Marker='o',MarkerFaceColor=[1, 0.5, 0],LineWidth=1);
hold on;
grid on;
title('"for Van Der Waals equation of state" : Newton-Raphson method');
xlabel('Iterations');
ylabel('Approximate % relative error');
hold off;

% ---------------------------------------------------------------------- %

%% 1.3>> solving for V(molar volume) using "Redlich-Kwong equation of state" : fsolve method
molar_volume_initial_guess_Redlich_fsolve = 0.003; % m^3/mol

% using "fsolve" function 
options2 = optimset('Display', 'iter-detailed');
disp('Iteration details for "Redlich-Kwong equation of state" : fsolve method :');
molar_volume_Redlich_fsolve = fsolve(@RedlichFsolve, molar_volume_initial_guess_Redlich_fsolve, options2);

% ---------------------------------------------------------------------- %

%% 1.4>> solving for V(molar volume) using "Redlich-Kwong equation of state" : Newton-Raphson method
% defining the constants "a" & "b"
a_Redlich = ((0.4278*(R^2)*(Tc^2))/Pc);
b_Redlich = (0.0867*R*Tc)/(Pc);

% initial guess value 
molar_volume_Redlich_0 = 0.003; % m^3/mol
ea_Redlich = 100;

tol_Redlich = 10^-4; % tolerance value
max_iterations_Redlich = 100;
iter_Redlich = 0;

while(iter_Redlich <= max_iterations_Redlich)
    iter_Redlich = iter_Redlich + 1;

    molar_volume_Redlich = molar_volume_Redlich_0;
    % applying Newton-Raphson Method
    func_Redlich = (R*T)/(molar_volume_Redlich - b_Redlich) - a_Redlich/((molar_volume_Redlich)*((molar_volume_Redlich + b_Redlich)^2)*(T^(0.5))) - P;
    func_derivative_Redlich = -(R*T)/((molar_volume_Redlich - b_Redlich)^2) + a_Redlich/((molar_volume_Redlich^2)*((molar_volume_Redlich + b_Redlich)^2)*(T^(0.5))) + (2*a_Redlich)/((molar_volume_Redlich)*((molar_volume_Redlich + b_Redlich)^3)*(T^(0.5)));
    
    molar_volume_Redlich_0 = molar_volume_Redlich - (func_Redlich/func_derivative_Redlich);
    ea_Redlich = abs((molar_volume_Redlich_0 - molar_volume_Redlich)/(molar_volume_Redlich));
    array2(iter_Redlich) = ea_Redlich;

    if(ea_Redlich < tol_Redlich || iter_Redlich == max_iterations_Redlich)
        break;
    end
end

size_Redlich_iter = size(array2);

% Plot for the relative error vs iterations
subplot(3,1,2);
x_Redlich = 1:size_Redlich_iter(2);
y_Redlich = array2.*100;     % converting relative error to % error

plot(x_Redlich,y_Redlich,LineStyle="-",Color='cyan',Marker='o',MarkerFaceColor=[1, 0.5, 0],LineWidth=1);
hold on;
grid on;
title('"for Redlich-Kwong equation of state" : Newton-Raphson method');
xlabel('Iterations');
ylabel('Approximate % relative error');
hold off;

% ---------------------------------------------------------------------- %

%% Displaying the answers :
% 1.1>>
disp('Using "Van Der Waals equation of state" : via fsolve method : ');
disp(['The molar volume is ' num2str(molar_volume_VanDer_fsolve) ' m^3/mol.']);
disp(' ');
% 1.2>>
disp('Using "Van Der Waals equation of state" : via Newton-Raphson method : ');
disp(['The molar volume is ' num2str(molar_volume_VanDer_0) ' m^3/mol.']);
disp(['Number of iterations needed : ', num2str(size_VanDer_iter(2))]);
disp(' ');
% 1.3>>
disp('Using "Redlich-Kwong equation of state" : via fsolve method : ');
disp(['The molar volume is ' num2str(molar_volume_Redlich_fsolve) ' m^3/mol.']);
disp(' ');
% 1.4>>
newline;
disp('Using "Redlich-Kwong equation of state" : via Newton-Raphson method : ');
disp(['The molar volume is ' num2str(molar_volume_Redlich_0) ' m^3/mol.']);
disp(['Number of iterations needed : ', num2str(size_Redlich_iter(2))]);

%% Plotting both the NR-method graphs in a new plot to compare them(1.2 & 1.4) : 
x1 = 1:size_VanDer_iter(2);
y1 = array1.*100;

x2 = 1:size_Redlich_iter(2);
y2 = array2.*100;

subplot(3,1,3);
plot(x1,y1,LineStyle="-",Color='b',Marker='o',MarkerFaceColor=[1, 0.5, 0],LineWidth=1);
hold on;
grid on;

title('Comparing approximate %relative errors : Newton Raphson Method');
xlabel('Iterations');
ylabel('Approximate % relative error');

plot(x2,y2,LineStyle="-",Color='g',Marker='o',MarkerFaceColor=[1, 0.5, 0.5],LineWidth=1);
legend('"for Van Der Waals equation of state"', '"for Redlich-Kwong equation of state"');

hold off;

%% All the function definitions are given below :

%% 1.1>> Function to solve VanDerWaals eq using fsolve method :
function Vol_per_mole_VanDer = vanderFsolve(V)
    global P R T Pc Tc

    % defining Van Der Waals constants "a" & "b"
    a = (27*(R^2)*(Tc^2))/(64*Pc);
    b = (R*Tc)/(8*Pc);

    % using Van Der Waals equation
    Vol_per_mole_VanDer = (R*T)/(V - b) - a/(V^2) - P;
end

%% 1.3>> Function to solve Redlich-Kwong eq using fsolve method :
function Vol_per_mole_Redlich = RedlichFsolve(V)
    global P R T Pc Tc

    % defining Van Der Waals constants "a" & "b"
    a = (0.4278*(R^2)*(Tc^2))/Pc;
    b = (0.0867*R*Tc)/Pc;

    % using Van Der Waals equation
    Vol_per_mole_Redlich = (R*T)/(V - b) - a/(V*((V + b)^2)*(T^(0.5))) - P;
end

%% Note : slight changes made while solving this question :
% 1>>
% In the expressions of "b" constant for both VanDerWaals & Redlich-Kwong
% equations, in place of "T" there should be "Tc" (critical temperature)

% 2>>
% In the Redlich-Kwong equation of state : the only change that should be
% made is : (V*((V+b)^2)*(T^(0.5))) , but in the question it's given (V-b),
% that's changed to (V+b) while solving this and the other (V-b) term is
% unchanged.