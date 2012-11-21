%% Project design script
clc; clear;
%%%%%%%%%%%%%%%%%%%%%%%% Specifications %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Vdd = 2.5; % in volts
Vss = -2.5; % in Volts
Rout = 5e3; % in ohms (really 1/2 Rout)
Cin = 100e-15; % in fF
f3dB_target = 90e6; %in Hz
P_totl = 1.4e-3; %in Watts
IDtot = P_totl / (Vdd - Vss)
Tau_total = 1/(2*pi) * 1/f3dB_target; % in seconds
Cout = 1000e-15; %F really this is 2*Cout which is required for 1/2 circuit
Rm = 20e3; % 20k transresistance small signal

%%%%%%%%%%%%%%%%%%%% Technology Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lmin = 1e-6;    % m
Cox = 2.3e-3;   % F/m^2
kp_n = 50e-6;   % A/V^2
kp_p = 25e-6;   % A/V^2

mu_n = kp_n / Cox;
mu_p = kp_p / Cox;

Vt0 = 0.5;      % V
gamma = 0.6;    % V^(1/2)
phi = 0.4;      % V

%%%%%%%%%%%%%%%%%%%% Simplifying assumptions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Csb_Cgs = 0.33;
Cdb_Cgs = 0.33;
Cgd_Cgs = 0.25;

Vout = 0;
Vsb3 = Vout - Vss;
Vt3 = Vt0 + gamma * (sqrt(2 * phi + Vsb3) - sqrt(2 * phi))

%%%%%%%%%%%%%%%%%%%% Design Choices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L1 = Lmin;
L2 = Lmin;
L3 = Lmin;
LL1 = Lmin;
LL2 = Lmin;

%%%%%%%%%%%%%% Sweeping Branch 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Id1 = linspace(15E-6, 75E-6, 100);
Vov1 = linspace(.15, 1, 100);
[Id1_mesh Vov1_mesh] = meshgrid(Id1, Vov1);
tau1 = Vov1_mesh ./ (2 * Id1_mesh) * Cin + ...
         1.33 * 2 / 3 * L1^2 ./ (mu_n * Vov1_mesh); 

% plotting
figure(1); mesh(Id1_mesh, Vov1_mesh, tau1); 
xlabel('Id1'); ylabel('Vov1'); title('tau 1');

% extract parameters
[min_tau1 min_tau1_row_idx] = min(tau1);
[min_tau1 min_tau1_col_idx] = min(min_tau1);
Id1_min_idx = min_tau1_row_idx(min_tau1_col_idx);
Vov1_min_idx = min_tau1_col_idx;

Id1 = Id1(Id1_min_idx);
Vov1 = Vov1(Vov1_min_idx);
tau1 = tau1(Id1_min_idx, Vov1_min_idx);
W1 = 2 * Id1 * L1 / (kp_n * Vov1.^2);
gm1 = 2 * Id1 / Vov1;
Cgs1 = (tau1 * gm1 - Cin) / 1.33;

%%%%%%%%%%%%%% Sweeping Branch 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Id3 = linspace(75E-6, 200E-6, 100);
Vov3 = linspace(.15, .85, 100);
[Id3_mesh Vov3_mesh] = meshgrid(Id3, Vov3);
tau3 = 1.33 / 1.2 * 2 / 3 * L3^2 ./ (mu_n * Vov3_mesh) + ...
         1 / 1.2 * Vov3_mesh ./ (2 * Id3_mesh) * Cout; 

% plotting
figure(2); mesh(Id3_mesh, Vov3_mesh, tau3); 
xlabel('Id3'); ylabel('Vov3'); title('tau 3');

% extract parameters
[min_tau3 min_tau3_row_idx] = min(tau3);
[min_tau3 min_tau3_col_idx] = min(min_tau3);
Id3_min_idx = min_tau3_row_idx(min_tau3_col_idx);
Vov3_min_idx = min_tau3_col_idx;

Id3 = Id3(Id3_min_idx)
Vov3 = Vov3(Vov3_min_idx)
tau3 = tau3(Id3_min_idx, Vov3_min_idx);
W3 = 2 * Id3 * L3 / (kp_n * Vov3^2);
gm3 = 2 * Id3 / Vov3;
Cgs3 = (1.2 * tau3 * gm3 - Cout) / 1.33;

VovL2 = 1 - Vov3; 
Id2 = IDtot - Id1 - Id3;
gmL2 = 2 * Id2 / VovL2
WL2 = 2 * Id2 * LL2 / (kp_p * VovL2^2);
%%%%%%%%%%%%%% Sweeping Branch 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Av2 = linspace(1, 40, 100);
Vov2 = linspace(.15, 1, 100);

[Av2_mesh Vov2_mesh] = meshgrid(Av2, Vov2);

tau2 = Rm * gmL2 / .8 * (1 + .25 * (1 + Av2_mesh)) * 2 / 3 * L2^2 ./ (mu_n * Vov2_mesh) + ...
       0.58 * Av2_mesh * 2 / 3 * L2^2 ./ (mu_n * Vov2_mesh) + ...
       0.41 * Cgs3 * Vov2_mesh / (2 * Id2) + ...
       1.33 * 2 / 3 * LL2^2 / (mu_p * (1 - Vov3));

% plotting
figure(3); mesh(Av2_mesh, Vov2_mesh, tau2);
xlabel('Av2'); ylabel('Vov2'); title('tau 2');

% extract parameters
[min_tau2 min_tau2_row_idx] = min(tau2);
[min_tau2 min_tau2_col_idx] = min(min_tau2);
Av2_min_idx = min_tau2_row_idx(min_tau2_col_idx);
Vov2_min_idx = min_tau2_col_idx;

Av2 = Av2(Av2_min_idx);
Vov2 = Vov2(Vov2_min_idx);
tau2 = tau2(Av2_min_idx, Vov2_min_idx);
W2 = 2 * Id2 * L2 / (kp_n * Vov2^2);
gm2 = Av2 * gmL2
gm2 = 2 * Id2 / Vov2
gmL1 = Av2 * .8 / Rm;
VovL1 = 2 * Id1 / gmL1;
WL1 = 2 * Id1 * LL1 / (kp_p * VovL1^2);
%%%%%%%%%%%%%% Consolidate and Report Results %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vov = [Vov1 Vov2 Vov3]
VovL = [VovL1 VovL2]
tau = [tau1 tau2 tau3]
W = [W1 W2 W3]
WL = [WL1 WL2]
Id = [Id1 Id2 Id3]
