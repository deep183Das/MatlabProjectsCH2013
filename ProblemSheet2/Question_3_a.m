% Given parameters
epsilon = 0.5e-3;  % Surface roughness in meters
hydraulic_diameter = 0.1;  % Hydraulic diameter in meters

%velocity_range = linspace(0.0892, 8.92, 100);  % Velocity range in m/s
velocity_range = linspace(10^4, 10^6, 100);  % Velocity range in m/s

density = 997;  % Density of water in kg/m^3
viscosity = 0.0008891;  % Viscosity of water in kg/(m*s)

% Initialize array to store friction factors
ffsol = zeros(1, 100);

% Tolerance for Newton-Raphson convergence
tolerance = 1e-4;

% Maximum number of iterations
max_iterations = 1000;

% Perform iteration for each velocity in the range
for i = 1:100
    velocity = velocity_range(i);
    
    % Initial guess for Reynolds number
    % reynolds_initial = (density * velocity * hydraulic_diameter) / viscosity;
    reynolds_initial = velocity;

    % Perform Newton-Raphson iteration to find friction factor
    % Initial guess for friction factor
    f0 = 0.0003;
    f = f0;

    for iter = 1:max_iterations
        f = f0;
        friction_calc = 1 / sqrt(f) + 2 * log10(epsilon / (3.71 * hydraulic_diameter) + 2.51 / (reynolds_initial * sqrt(f)));
        friction_calc_diff = -(1/(sqrt(f))^3)*(0.5 + (2.51/(reynolds_initial*log(10)))*(1/((epsilon/(3.71*hydraulic_diameter)) + (2.51/(reynolds_initial*sqrt(f))))));
        
        f0 = f - (friction_calc/friction_calc_diff);
        
        if abs(f0 - f) < tolerance
            ffsol(i) = f0;
            break;
        else
            ffsol(i) = f0;
        end
    end
end

% Plot for the friction factor values
plot(velocity_range,ffsol,LineStyle="-",Color='r',LineWidth=1);