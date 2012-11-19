** Including the model file
.include /usr/class/ee114/hspice/ee114_hspice.sp

* defining the supply voltages

vdd vdd 0 2.5
vss vss 0 0

*** Ideal Sources to be replaced later
** +term -term value
I1a vdd vb DC=100u

*** nmos
*** drain gate source bulk mostype w_value l_value
Mu vb vb vx vss nmos114 w=20u l=1u 
Ml vx vb vss vss nmos114 w=10u l=1u 

* M1 vdd vdd vb vss nmos114 w=3u l=1u
* Mu vb vb vx vss nmos114 w=2u l=1u
* Ml vx vb vss vss nmos114 w=2u l=1u



* defining the analysis

.op
.option post brief nomod

.end
