* Design Problem, ee114/214A- 2012
* Please fill in the specification achieved by your circuit 
* before your submit the netlist.
**************************************************************
* The specifications that this script achieves are:
* sunetid = rohitpid, samfok
* Power  = 1.5667 mW  
* Gain   = 20.148 K 
* BandWidth = 90.041  MHz
***************************************************************


** Including the model file
.include /usr/class/ee114/hspice/ee114_hspice.sp

* Defining Top level circuit parameters
.param Cin = 100f
.param CL  = 500f
.param RL  = 10K

* defining the supply voltages

vdd vdd 0 2.5
vss vss 0 -2.5

* Defining the input current source

** For ac simulation uncomment the following 2 lines**
 Iina		iina	vdd	ac	0.5	
 Iinb		vdd	iinb	ac	0.5	

** For transient simulation uncomment the following 2 lines**
*Iina		iina	vdd	sin(0 0.5u 1e6)
*Iinb		vdd	iinb	sin(0 0.5u 1e6)

* Defining Input capacitance

Cina	vdd	iina 'Cin'
Cinb	vdd	iinb 'Cin'

* Defining the differential load 

RL	vouta		voutb		'RL'
CL	vouta		voutb		'CL'

*** Your Trans-impedance Amplifier here ***
**nmos***
*name drain gate source bulk type parameters*
M1a  node_1a 0 iina vss nmos114 w=14.2u l=1u
M1b  node_1b 0 iinb vss nmos114 w=14.2u l=1u
M2a  node_2a node_1a ibias2 vss nmos114 w=6.8u l=1u
M2b  node_2b node_1b ibias2 vss nmos114 w=6.8u l=1u
M3a  vdd node_2a vouta vss nmos114 w=40.2u l=1u
M3b  vdd node_2b voutb vss nmos114 w=40.2u l=1u

**pmos***
*name drain gate source bulk type parameters*
ML1a node_1a node_1a vdd vdd pmos114 w=2.4u l=1u 
ML1b node_1b node_1b vdd vdd pmos114 w=2.4u l=1u 
ML2a node_2a node_2a vdd vdd pmos114 w=2.8u l=1u 
ML2b node_2b node_2b vdd vdd pmos114 w=2.8u l=1u 

*** Your Bias Circuitry here ***
**nmos***
*name drain gate source bulk type parameters*
Mbias1a iina nbias vss vss nmos114 w=2.2u l=2u
Mbias1b iinb nbias vss vss nmos114 w=2.2u l=2u
Mbias2a ibias2 nbias vss vss nmos114 w=2.2u l=2u
Mbias2b ibias2 nbias vss vss nmos114 w=2.2u l=2u
Mbias3a vouta nbias vss vss nmos114 w=5.6u l=2u
Mbias3b voutb nbias vss vss nmos114 w=5.6u l=2u

** for students enrolled in ee114, you can use the given ideal voltage source
*Vbias_n nbias vss 1.5   *replace --- by your value

*** drain gate source bulk mostype w_value l_value
*M1 vb vb vdd vdd pmos114 w=2u l=20u

*** nmos
*** drain gate source bulk mostype w_value l_value
Mu nbias nbias vx vss nmos114 w=2u l=1u
Ml vx nbias vss vss nmos114 w=2u l=1u

*Resistors
R vdd nbias 140k

** For students enrolled in ee214A, you need to design your bias ciruit. You cannpt use Vbias_n as ideal voltage source.



* defining the analysis

.op
.option post brief nomod

** For ac simulation uncomment the following line** 
.ac dec 100 100 10g
.measure ac gainmax max vdb(vouta)
.measure ac f3db when vdb(vouta)='gainmax-3'

** For transient simulation uncomment the following line **
*.tran 0.01u 4u 

.end
