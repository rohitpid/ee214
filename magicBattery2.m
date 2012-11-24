clc;
clear;
% You give me a Vb you want
Vdd = 5;
Vb = 1.5;
k = [1:20]'; % you give me a device scaling parameter
Vt = 0.5;
Wmin = 2;
W = Wmin*k;
L = 1;
KP = 50e-6;

Ibias = ((Vb-Vt)^2*(W ./ L)*KP) ./ ((k+1)*2)

R = (Vdd-Vb) ./ Ibias
