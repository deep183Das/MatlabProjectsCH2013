%% Following the 1st application of local function, 
% here for a range of temperature_C values, pressure is calculated 
j = 1;
for temperature_C = 80:2:100
    pressure_mmHg(j) = vapor_pressure(temperature_C);
    j = j+1;
end

disp(['The Vapour Pressures are \n' num2str(pressure_mmHg) '\n mmHg']);

%define the vapor_pressure function
function p = vapor_pressure(T)
    % Define Antoine's Equation parameters for a substances
    A = 8.07131;
    B = 1730.63;
    C = 233.426;

    p = 10^(A - B/(T + C));
end
