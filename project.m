%% Project design script
clc; clear;
%%%%%%%%%%%%%%%%%%%%%%%% Specifications %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Vdd = 2.5; % in volts
Vss = -2.5; % in Volts
Rout = 5e3; % in ohms (really 1/2 Rout)
Cin = 100e-15; % in fF
W3db = 90e6; %in Hz
P_totl = 3e-3; %in Watts
Tau_total = 1/(2*pi*W3db); % in seconds
ss_transresistance = 20e3; % 20k transresistance small signal
iindm = 2.5e-6;
Cout = 200e-15; %F really this is 2*Cout which is required for 1/2 circuit

%%%%%%%%%%%%%%%%%%%% Technology Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lmin = 1e-6; % in meters
Cox = 2.3; %fF/m^2
KPn = 50; % uA/V^2
KPp = 25; % uA/V^2
mu_n = KPn/Cox;
mu_p = KPp/Cox;
Colp = 0.5; %fF



%%%%%%%%%%%%%% Design Choices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gain of 2nd stage
Av2 = 10;

%How much tau we give to each stage of the circuit
Tau = Tau_total*[0.25 0.25 0.25 0.25];

%%%%%%%%%%%%%%%%%%%%%
% x1 = Cgs1/Cin
% x2 = Cgs2/Cgs1
% x3 = Cgs3/Cout
x = [1 1 1];

w1 = 1e-6;
w2 = 1e-6;
L1 = 1e-6;
L2 = 1e-6;
L3 = 1e-6;

%%%%%%%%%%%%%% END FREE PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%% Dependent Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%

gm1 = Cin/Tau(1)*(1+1.33*x(1))
k1 = 2*Lmin/w1; % CgsL1/Cgs1
gmL1 = (1/Tau(2))*(0.58+(1.25+0.25*Av2)*x(2)+1.33*k1)*x(1)*Cin;
k2 = 2*Lmin/w2; % CgsL2/Cgs2
gmL2 = (1/Tau(3))*((0.58+(1+0.33)*k2)*x(2)*x(1)*Cin+0.42*x(3)*Cout);
gm3 = (((1/Tau(4)) * ((x(3)+1)*Cout)-1)/Rout)/1.2
gm2 = Av2*gmL2

Cgs1 = x(1)*Cin
Cgs2 = x(2)*Cgs1
Cgs3 = x(3)*Cout

%transit frequencie s
ft1 = (1/(2*pi)) * (gm1/Cgs1)
ft2 = (1/(2*pi)) * (gm2/Cgs2)
ft3 = (1/(2*pi)) * (gm3/Cgs3) 

%Overvoltages
Vov1 = ft1 / ((1/2*pi) * (3/2) * (mu_n / (L1^2 + 3/2*L1 * Colp/Cox)))
Vov2 = ft2 / ((1/2*pi) * (3/2) * (mu_n / (L1^2 + 3/2*L1 * Colp/Cox)))
Vov3 = ft3 / ((1/2*pi) * (3/2) * (mu_n / (L1^2 + 3/2*L1 * Colp/Cox)))
