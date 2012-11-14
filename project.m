%% Project design script
% Specifications

Vdd = 2.5; % in volts
Vss = -2.5; % in Volts
Rout = 10e3; % in ohms
Cin = 100e-15; % in Farads
W3db = 90e6; %in Hz
P_totl = 3e-3; %in Watts
Tau_total = 1/(2*pi*W3db); % in seconds
ss_transresistance = 20k; % 20k transresistance small signal
iindm = 2.5e-6;

%How much tau we give to each stage of the circuit
TauPartitioning = [0.25 0.25 0.25 0.25];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x1 = Cgs1/Cin
% x2 = Cgs2/Cgs1
% x3 = Cgs3/(2*Cout)
x = [1 1 1];