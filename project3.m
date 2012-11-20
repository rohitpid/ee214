%% Project design script
clc; clear;
%%%%%%%%%%%%%%%%%%%%%%%% Specifications %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Vdd = 2.5; % in volts
Vss = -2.5; % in Volts
Rout = 5e3; % in ohms (really 1/2 Rout)
Cin = 100e-15; % in fF
f3dB_target = 90e6; %in Hz
P_totl = 2.8e-3; %in Watts
IDtot = P_totl / (Vdd - Vss);
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
%%%%%%%%%%%%%%%%%%%% Simplifying assumptions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Csb_Cgs = 0.33;
Cdb_Cgs = 0.33;
Cgd_Cgs = 0.25;

%%%%%%%%%%%%%%%%%%%% Design Choices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L1 = 1e-6;
L2 = 1e-6;
L3 = 1e-6;
LL1 = 1e-6;
LL2 = 1e-6;

%%%%%%%%%%%%%% Optimization Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vov1 = .3;
Vov2 = .3;
Vov3 = .3;
Id1 = 75E-6;
Id3 = 400E-6;
Av2 = 10;

%%%%%%%%%%%%%%%%%%%%%%%%% Dependent Params %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% branch 1
Vov1 = linspace(.15, 1, 50);
Id1 = linspace(15E-6, 75E-6, 50);
[Id1_mesh Vov1_mesh] = meshgrid(Id1, Vov1);
tau_b1 = Cin * Vov1_mesh ./ (2*Id1_mesh) + 1.33 * 2/3 * L1^2 ./ (mu_n * Vov1_mesh); 

figure(1); mesh(Id1_mesh, Vov1_mesh, tau_b1); xlabel('Id1'); ylabel('Vov1'); title('branch 1');
[x y] = min(Id1_mesh);
[w z] = min(x);
Id1_min_idx = y(z);
Vov1_min_idx = z;
Id1 = Id1(Id1_min_idx)
Vov1 = Vov1(Vov1_min_idx)
tau_b1 = tau_b1(Id1_min_idx, Vov1_min_idx)
VovL1 = 2 * Id1 * Rm / (0.8 * Av2)
W1 = 2 * Id1 * L1 ./ (kp_n * Vov1.^2)
WL1 = 2 * Id1 * LL1 / (kp_p * VovL1^2)


% branch 3
Vov3 = linspace(.15, 1, 50);
Id3 = linspace(75E-6, 200E-6, 50);
[Id3_mesh Vov3_mesh] = meshgrid(Id3, Vov3);
tau_b3 = 1.33/ 1.2 * 2/3 * L3^2 ./ (mu_n * Vov3_mesh) + Vov3_mesh ./ (2 * Id3_mesh) * Cout; % neglecting Csb3

figure(2); mesh(Id3_mesh, Vov3_mesh, tau_b3); xlabel('Id3'); ylabel('Vov3'); title('tau_b3');
[x y] = min(Id3_mesh);
[w z] = min(x);
Id3_min_idx = y(z);
Vov3_min_idx = z;
Id3 = Id3(Id3_min_idx)
Vov3 = Vov3(Vov3_min_idx)
tau_b3 = tau_b3(Id3_min_idx, Vov3_min_idx);
W3 = 2 * Id3 * L2 / (kp_n * Vov3^2);

gm3 = 2 * Id3 / Vov3;
Cgs3 = 2 * L3^2 * gm3 / (3 *mu_n *Vov3);

% branch 2
tau_b2 = Tau_total - tau_b1 - tau_b3;
Vov2 = .3; % arbitrarly
Id2 = IDtot - Id1 - Id3;
VovL2 = Vov2 * Av2;
W2 = 2 * Id2 * L2 / (kp_n * Vov2^2)
Cgs2 = 2 / 3 * W2 * L2 * Cox;
WL2 = 2 * Id2 * L2 / (kp_p * VovL2^2)

