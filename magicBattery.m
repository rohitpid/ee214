% calculates parameters for magic battery circuit
clc; clear;
Vb = 1; % V

k = 3; % relative device scaling

wl = 2; % ratio of w/l for magic battery

kp = 50E-6; % A/V^2
Vdd = 2.5;  % V
Vss = 0; % V
Vt = .5;    % V

Vov = (Vb - Vt - Vss) / sqrt(k + 1)
Id = 1/2 * kp * wl * Vov^2

wl_1 = Id / (kp * (Vdd - Vb - Vt) * (Vdd - Vb))

Id = 100E-6;
Vov = sqrt(2*Id/(kp * wl));
k = ((Vb - Vt) / Vov)^2 - 1