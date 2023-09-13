%% ProblemSheet6 q3

% importing the data
variable = load("data_for_lab.txt");

%% importing all the columns in the arrays of the same name as of the corresponding column names in the "data_for_lab.txt" file
time = variable(:,1);      
npart = variable(:,2);
tres = variable(:,3);            
T = variable(:,4);           
Z = variable(:,5);           
N2 = variable(:,6);           
CO = variable(:,7);   
A1CH3_C7H9 = variable(:,8);       
BIOOIL  = variable(:,9);         
rho = variable(:,10);

%% calling the "function_file" to plot the specified plots
% b>
x_biooil = [];
x_co = [];
x_alch3 = [];
t = [0.1 0.2 0.65 0.9 1];
for i = 1:5
    x_biooil(i) = BIOOIL(find(time==t(i)));
    x_co(i) = CO(find(time==t(i)));
    x_alch3(i) = A1CH3_C7H9(find(time==t(i)));
end

% plots for a & c>
function_file(time,BIOOIL,'time','mass-fraction',1,'b',t,x_biooil);
function_file(time,CO,'time','mass-fraction',1,'cyan',t,x_co);
function_file(time,A1CH3_C7H9,'time','mass-fraction',1,'g',t,x_alch3);
legend('BIOOIL vs time', '','CO vs time', '','A1CH3-C7H9 vs time', '');
hold off;

% d>
% molar mass in Kg/mol
molmass_biooil = 0.017008;
molmass_co = 0.02801;
molmass_alch3 = 0.092134;

% number of moles / total mass
mol_biooil = BIOOIL./molmass_biooil;
mol_co = CO./molmass_co;
mol_alch3 = A1CH3_C7H9./molmass_alch3;

% total moles / totaL mass
total_mol = mol_alch3 + mol_co + mol_biooil;

% mole fraction = number of moles / total moles
molfraction_biooil = mol_biooil./total_mol;
molfraction_co = mol_co./total_mol;
molfraction_alch3 = mol_alch3./total_mol;
