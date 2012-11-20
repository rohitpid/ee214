** Including the model file
.include /usr/class/ee114/hspice/ee114_hspice.sp

* defining the supply voltages

vdd vdd 0 2.5
vss vss 0 -2.5

*** pmos
*** drain gate source bulk mostype w_value l_value
M1 vb vb vdd vdd pmos114 w=2u l=20u

*** nmos
*** drain gate source bulk mostype w_value l_value
Mu vb vb vx vss nmos114 w=20u l=1u
Ml vx vb vss vss nmos114 w=5u l=1u

* defining the analysis

.op
.option post brief nomod

.end
