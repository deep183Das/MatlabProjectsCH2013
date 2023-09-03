%% Using a local function, finding the value of what is needed

temperature_C = 80;
pressure_mmHg = vapor_pressure(temperature_C);
% "vapor_pressure" is the local function, in the above line it's called
% It has only argument "temperature_C" 


% So the local function is defined below the line where it's called
function p = vapor_pressure(T)
    A = 8.07131;
    B = 1730.63;
    C = 233.426;

    % Antoine's equation
    p = 10^(A - B/(T + C));
end

