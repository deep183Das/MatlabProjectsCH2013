%% ProblemSheet-4 _ question 2
clear; close all;

%% defining variables :
    % equilibrium constants : K1 (for reaction 1) & K2 (for reaction 2)
    % T_Celcius : Temperature in Degree Celcius 
    % T_Kelvin : Temperature in Kelvin
    % extent of reactions : epsilon1 (for reaction 1) & epsilon2 (for reaction 2)

%% defining global variables 
global T_Celcius nt

nt = 100; % moles
epsilon_guess = [0.5,0.3];  % initial guess values for epsilon1 & epsilon2
options = optimset('Display', 'none', 'TolFun', 1e-20);

j = 1;  % for array updation
for T_Celcius = 800 : 50 : 1000
    epsilon_val = fsolve(@equations, epsilon_guess, options);

    EPSILON(j,1) = abs(epsilon_val(1));
    EPSILON(j,2) = abs(epsilon_val(2));
    j = j+1;
    disp(['Temperature : ' num2str(T_Celcius) ' degree celcius :: e1 = ' num2str(abs(epsilon_val(1))) ' & e2 = ' num2str(abs(epsilon_val(2)))]);
end

global k_e K k1 k2 e
function F = equations(epsilon)
    global T_Celcius nt k_e K
    
    T_Kelvin = T_Celcius + 273.15;  % conversion from degree celcius scale to Kelvin scale
    K1 = exp((-17249)/(T_Kelvin + 16.247));
    K2 = exp((-39649)/(T_Kelvin + 32.366));
    K = [K1,K2];
    k_e = exponent(K);

    equation1 = epsilon(1) - ((epsilon(1)*(epsilon(1) + 2*(epsilon(2)))) - ((nt - epsilon(1) - epsilon(2))*(nt + epsilon(1) + 2*epsilon(2)))*K1)*(k_e(1));
    equation2 = epsilon(2) - ((epsilon(2)*((epsilon(1) + 2*(epsilon(2)))^2)) - ((nt - epsilon(1) - epsilon(2))*((nt + epsilon(1) + 2*epsilon(2))^2))*K2)*(k_e(2));
    F = [equation1, equation2];
end

%% The following function is actually handling the error :

% from the given T values, the K1 & K2 values we are getting are so small
% that they are not being considered precisely, are hence considered as 0
% while fsolve is solving it, so this function is finding the exponential
% factor and that is multiplied in both the sides so that the small value
% of K1 & K2 get significance while fsolve solves this two simultaneous
% equations .

function e = exponent(K_val)
    global k1 k2 e

    k1 = K_val(1);
    while(k1 <= 1)
        k1 = k1*10;
    end

    k2 = K_val(2);
    while(k2 <= 1)
        k2 = k2*10;
    end

    e = [k1/K_val(1), k2/K_val(2)];
end

%% changes made in this question :
% in the expression of K2 in terms of extent of reactions, the numerator
% will be : (e2*(e1 + 2*e2)^2)
