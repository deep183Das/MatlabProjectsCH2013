%% Calculate vapor pressure at a given temperature

% temperature_C is a vector and as a whole it's passed to function
temperature_C = (80:2:100);
% Temperature in degree celcius

pressure_mmHg = vapor_pressure(temperature_C);

disp(['The Vapour Pressures are ' num2str(pressure_mmHg) 'mmHg']);

%define the vapor_pressure function
function p = vapor_pressure(T)
% Define Antoine's Equation parameters for a substances
    A = 8.07131;
    B = 1730.63;
    C = 233.426;
    % operation on a vector : element by element
    p = 10.^(A - B./(T + C));
end
