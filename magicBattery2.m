% You give me a Vb you want
Vb = 1.65;
k = 3; % you give me a device scaling parameter
Vt = 0.5;
W = 6;
L = 1;
KP = 50e-6;

Ibias = ((Vb-Vt)^2*(W/L)*KP)/((k+1)*2)

R = 5/Ibias
