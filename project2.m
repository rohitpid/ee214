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
Cout = 200e-15; %F really this is 2*Cout which is required for 1/2 circuit
Rm = 20e3; % 20k transresistance small signal

%%%%%%%%%%%%%%%%%%%% Technology Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lmin = 1e-6;    % m
Cox = 2.3e-3;   % F/m^2
kp_n = 50e-6;   % A/V^2
kp_p = 25e-6;   % A/V^2

%%%%%%%%%%%%%%%%%%%% Simplifying assumptions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Csb_Cgs = 0.33;
Cdb_Cgs = 0.33;
Cgd_Cgs = 0.25;
%%%%%%%%%%%%%%%%%%%% Design Choices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%How much tau we give to each stage of the circuit
Tau = Tau_total*[0.25 0.25 0.25 0.25];

% x1 = Cgs1/Cin
% x2 = Cgs2/Cgs1
% x3 = Cgs3/Cout
% x = [1 1 1];

L1 = 1e-6;
L2 = 1e-6;
L3 = 1e-6;
LL1 = 1e-6;
LL2 = 1e-6;

Vov1 = 0.5;
Vov2 = 0.5;
Vov3 = 0.5;
VovL1 = 0.5;
VovL2 = 0.5;

%%%%%%%%%%%%%% Optimization Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ID1_IDtot = 0.3;    % fraction of total current in branch 1
ID2_IDtot = 0.4;    % fraction of total current in branch 2
Av2 = 10;           % Gain of 2nd stage


%%%%%%%%%%%%%%%%%%%%%%%%% Dependent Params %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

feasible_ID = [];
feasible_W = [];
minW = 1e-6*[1 1 1 1 1];
sweep = 1:100;

ID1_IDtot = linspace(.1, .7, 100);
ID2_IDtot = linspace(.1, .7, 100);

for i = 1 : length(ID1_IDtot)
    for j = 1 : length(ID2_IDtot)
        ID1 = ID1_IDtot(i) * IDtot;
        ID2 = ID2_IDtot(j) * IDtot;
        ID3 = (1 - ID1_IDtot(i) - ID2_IDtot(j)) * IDtot;
        
        if ID1_IDtot(i) + ID2_IDtot(j) > 1
            break;
        end
        
        %%%% Calculations for Tau1
        % M1
        gm1 = 2*ID1/Vov1;
        w1 = 2*ID1*L1 / (kp_n*Vov1^2);
        Cgs1 = 2/3*w1*L1*Cox;
        Csb1 = Cgs1*Csb_Cgs;
        Cgd1 = Cgs1*Cgd_Cgs;
        Cdb1 = Cgs1*Cdb_Cgs;
        
        tau1 = (1/gm1)*(Cgs1+Cin+Csb1);
        
        %%% Calculations for Tau2
        % ML1
        gmL1 = 2*ID1/VovL1;
        wL1 = 2*ID1*LL1 / (kp_p*VovL1^2);
        CgsL1 = 2/3*wL1*LL1*Cox;
        CdbL1 = CgsL1*Cdb_Cgs;
        
        % M2
        gm2 = 2*ID2/Vov2;
        w2 = 2*ID2*L2 / (kp_n*Vov2^2);
        Cgs2 = 2/3*w2*L2*Cox;
        Csb2 = Cgs2*Csb_Cgs;
        Cgd2 = Cgs2*Cgd_Cgs;
        Cdb2 = Cgs2*Cdb_Cgs;
        tau2 = (1/gmL1)*(Cgd1+Cdb1+CgsL1+Cgs2+CdbL1+Cgd2) + (Rm/0.8)*Cgd2;
        
        %%% Calculations for Tau3
        %ML2
        gmL2  = 2*ID2/VovL2;
        wL2   = 2*ID2*LL2 / (kp_p*VovL2^2);
        CgsL2 = 2/3*wL2*LL2*Cox;
        CdbL2 = CgsL2*Cdb_Cgs;
        
        % M3
        gm3  = 2*ID3/Vov3;
        w3   = 2*ID3*L3 / (kp_n*Vov3^2);
        Cgs3 = 2/3*w3*L3*Cox;
        Csb3 = Cgs3*Csb_Cgs;
        Cgd3 = Cgs3*Cgd_Cgs;
        Cdb3 = Cgs3*Cdb_Cgs;
        gmb3 = gm3*0.2;
        gm3prime = gm3+gmb3;
        
        tau3 = (1/gmL2) * (Cgd2+Cgd3+Cdb2+CgsL2+CdbL2+ (1/(1+(gm3/gmb3)))*Cgs3);
        
        % Calculations for tau4
        
        tau4 = (Rout / (Rout * gm3prime + 1)) * (Cout+Csb3+Cgs3);
        
        tau = [tau1 tau2 tau3 tau4];
        
        f3dB = 1/(2*pi) * 1/sum(tau);
        
        IDVec = [ID1 ID2 ID3];
        Wvec = [w1 w2 w3 wL1 wL2];
        
        if(f3dB > f3dB_target && sum(Wvec > minW) == 5 && sum(IDVec*5) > 2.4e-3)
            disp('feasible point found');
            feasible_ID = [feasible_ID ; IDVec];
            disp(['i=' num2str(i) ' ' num2str(ID1_IDtot(i)) ' ' num2str(ID1)]);
            disp(['j=' num2str(j) ' ' num2str(ID2_IDtot(j)) ' ' num2str(ID2)]);
            feasible_W = [feasible_W; Wvec];
        end
    end
end

