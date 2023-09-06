%% PS5 Question 1b & 1c

% defining C1 & C2  : in mol/m^3
C1 = 0.1;
C2 = 0.01;

T = [300 1000]; % in K

% given vectors : k0 & Eact
k0 = [0.001 0.34];
Eact = [12000 5600];

% defining field names as 'pre_exponential_factor' and 'activation_energy' of the structure array "reactiondata"
reactiondata.pre_exponential_factor = k0;
reactiondata.activation_energy = Eact;

r = reactionrate1(T,C1,C2,reactiondata);
rate = [r(1), r(2)];

function r = reactionrate1(T,C1,C2,reactiondata)
    R = 8.314;
    r1 = (reactiondata.pre_exponential_factor(1))*(exp((-reactiondata.activation_energy(1))/(R*T(1))))*C1*C2;
    r2 = (reactiondata.pre_exponential_factor(2))*(exp((-reactiondata.activation_energy(2))/(R*T(2))))*C1*C2;
    r = [r1, r2];
end
