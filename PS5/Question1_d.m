%% PS5 Question 1d

% defining C1 & C2  : in mol/m^3
C1 = 0.1;
C2 = 0.01;

T = 300 : 100 : 1000; % in K

% given vectors : k0 & Eact
k0 = [0.001 0.34];
Eact = [12000 5600];

% defining field names as 'pre_exponential_factor' and 'activation_energy' 
reactiondata.pre_exponential_factor = k0;
reactiondata.activation_energy = Eact;

r = reactionrate1(T,C1,C2,reactiondata);

% need to collect all the columns of each row
rate1 = r(1,:);
rate2 = r(2,:);

%% plotting both the rates vs T
figure(1);
semilogy(T,rate1,LineStyle="-",Color='cyan',Marker='o',MarkerFaceColor=[0.5 0.5 0.5],LineWidth=1);
figure(2);
semilogy(T,rate2,LineStyle="-",Color='red',Marker='o',MarkerFaceColor=[0.5 1 1],LineWidth=1);

function r = reactionrate1(T,C1,C2,reactiondata)
    R = 8.314;

    r1 = (reactiondata.pre_exponential_factor(1)).*(exp((-reactiondata.activation_energy(1))./(R.*T))).*C1.*C2;
    r2 = (reactiondata.pre_exponential_factor(2)).*(exp((-reactiondata.activation_energy(2))./(R.*T))).*C1.*C2;
    r = [r1; r2];
end
