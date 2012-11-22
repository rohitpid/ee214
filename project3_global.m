clc; clear;
%%%%%%%%%%%%%%%%%%%%%%%% Specifications %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Vdd = 2.5; % in volts
Vss = -2.5; % in Volts
Rout = 5e3; % in ohms (really 1/2 Rout)
Cin = 100e-15; % in fF
f3dB_target = 90e6; %in Hz
P_totl = 1.4e-3; %in Watts
IDtot = P_totl / (Vdd - Vss);
Tau_total = 1/(2*pi) * 1/f3dB_target; % in seconds
Cout = 1000e-15; %F really this is 2*Cout which is required for 1/2 circuit
Rm = 11e3; % 20k transresistance small signal

%%%%%%%%%%%%%%%%%%%% Technology Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lmin = 1e-6;    % m
Wmin = 2e-6;    % m
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
Vt3 = Vt0 + gamma * (sqrt(2 * phi + Vsb3) - sqrt(2 * phi));

Vovbias = 1;
Lbias = 2e-6;  % m
%%%%%%%%%%%%%%%%%%%% Design Choices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L1 = Lmin;
L2 = Lmin;
L3 = Lmin;
LL1 = Lmin;
LL2 = Lmin;

%%%%%%%%%%%%%% Initialize Space %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = 20;
Id1_space = linspace(15E-6, 75E-6, n);
Vov1_space = linspace(.15, 1, n);
Id3_space = linspace(75E-6, 200E-6, n);
Vov3_space = linspace(.15, .85, n);
Av2_space = linspace(1, 40, n);
Vov2_space = linspace(.15, 1, n);

valid_Rm = [];
valid_f3dB = [];
valid_W = [];
valid_WL = [];
valid_Wbias = [];
valid_Id = [];

f3dB_max = 0;
Rm_max = 0;

for Id1_idx = 1 : length(Id1_space)
    Id1 = Id1_space(Id1_idx);
    Wbias1 = 2 * Id1 * Lbias / (kp_n * Vovbias);
    for Vov1_idx = 1 : length(Vov1_space)
        Vov1 = Vov1_space(Vov1_idx);
        %%%%% branch 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        tau1 = Vov1 ./ (2 * Id1) * Cin + ...
               1.33 * 2 / 3 * L1^2 ./ (mu_n * Vov1);
           
        W1 = 2 * Id1 * L1 / (kp_n * Vov1.^2);
        gm1 = 2 * Id1 / Vov1;
        Cgs1 = (tau1 * gm1 - Cin) / 1.33;
        
        for Id3_idx = 1 : length(Id3_space)
            Id3 = Id3_space(Id3_idx);
            Wbias3 = 2 * Id3 * Lbias / (kp_n * Vovbias);
            for Vov3_idx = 1 : length(Vov3_space)
                Vov3 = Vov3_space(Vov3_idx);
                %%%%% branch 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                tau3 = 1.33 / 1.2 * 2 / 3 * L3^2 ./ (mu_n * Vov3) + ...
                    1 / 1.2 * Vov3 ./ (2 * Id3) * Cout;
                
                W3 = 2 * Id3 * L3 / (kp_n * Vov3^2);
                gm3 = 2 * Id3 / Vov3;
                Cgs3 = (1.2 * tau3 * gm3 - Cout) / 1.33;
                
                VovL2 = 1 - Vov3;
                Id2 = IDtot - Id1 - Id3;
                Wbias2 = 2 * Id2 * Lbias / (kp_n * Vovbias);
                gmL2 = 2 * Id2 / VovL2;
                WL2 = 2 * Id2 * LL2 / (kp_p * VovL2^2);
                
                for Av2_idx = 1 : length(Av2_space)
                    Av2 = Av2_space(Av2_idx);
                    for Vov2_idx = 1 : length(Vov2_space)
                        Vov2 = Vov2_space(Vov2_idx);
                        %%%%% branch 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        tau2 = Rm * gmL2 / .8 * (1 + .25 * (1 + Av2)) * 2 / 3 * L2^2 ./ (mu_n * Vov2) + ...
                            0.58 * Av2 * 2 / 3 * L2^2 ./ (mu_n * Vov2) + ...
                            0.41 * Cgs3 * Vov2 / (2 * Id2) + ...
                            1.33 * 2 / 3 * LL2^2 / (mu_p * (1 - Vov3));
                        
                        W2 = 2 * Id2 * L2 / (kp_n * Vov2^2);
                        gm2 = Av2 * gmL2;
                        gmL1 = Av2 * .8 / Rm;
                        VovL1 = 2 * Id1 / gmL1;
                        WL1 = 2 * Id1 * LL1 / (kp_p * VovL1^2);
                        
                        %%%%%%%%%%%%%% Consolidate Results %%%%%%%%%%%%%%%%
                        tau = [tau1 tau2 tau3];
                        est_f3dB = 1 / (2 * pi * sum(tau));
                        est_Rm = 1 / gmL1 * Av2 * 0.8;
                        Widths = [W1 W2 W3 WL1 WL2 Wbias1 Wbias2 Wbias3];
                        ValidCircuit = est_f3dB >= f3dB_target && ...
                                       est_Rm >= Rm && ...
                                       sum(Widths >= Wmin) == 8;
                        if ValidCircuit
                            valid_Rm = [valid_Rm ; est_Rm];
                            valid_f3dB = [valid_f3dB; est_f3dB];
                            valid_W = [valid_W ; [W1 W2 W3]];
                            valid_WL = [valid_WL ; [WL1 WL2]];
                            valid_Id = [valid_Id ; [Id1 Id2 Id3]];
                            valid_Wbias = [valid_Wbias ; [Wbias1 Wbias2 Wbias3]];
                        end
                        if est_f3dB > f3dB_max && est_Rm >= Rm_max
                            W_max = [W1 W2 W3] * 1e6
                            WL_max = [WL1 WL2] * 1e6
                            Id_max = [Id1 Id2 Id3] * 1e6
                            Wbias_max = [Wbias1 Wbias2 Wbias3] * 1e6
                            f3dB_max = est_f3dB
                            Rm_max = est_Rm
                            if ValidCircuit
                                valid_W_max = [W1 W2 W3] * 1e6
                                valid_WL_max = [WL1 WL2] * 1e6
                                valid_Id_max = [Id1 Id2 Id3] * 1e6
                                valid_Wbias_max = [Wbias1 Wbias2 Wbias3] * 1e6
                                valid_f3dB_max = est_f3dB
                                valid_Rm_max = est_Rm
                                disp('ValidCicuit---------------------------');
                            else                                
                                disp('--------------------------------------');
                            end
                        end
                    end
                end
            end
        end
    end
end





