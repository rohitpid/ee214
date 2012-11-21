* Design Problem, ee114/214A- 2012
* Please fill in the specification achieved by your circuit 
* before your submit the netlist.
**************************************************************
* The specifications that this script achieves are:
* 
* Power  =    mW 
* Gain   =    K
* BandWidth =   MHz
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

*** nmos
*** drain gate source bulk mostype w_value l_value
M1a m1a_out 0 iina vss nmos114 w=23.4u l=1u
M1b m1b_out 0 iinb vss nmos114 w=23.4u l=1u
M2a m2a_out m1a_out ibias2a vss nmos114 w=11.8u l=1u
M2b m2b_out m1b_out ibias2b vss nmos114 w=11.8u l=1u
M3a vdd m2a_out vouta vss nmos114 w=60.8u l=1u
M3b vdd m2b_out voutb vss nmos114 w=60.8u l=1u

*** pmos
*** drain gate source bulk mostype w_value l_value
ML1a m1a_out m1a_out vdd vdd pmos114 w=8.4u l=1u
ML1b m1b_out m1b_out vdd vdd pmos114 w=8.4u l=1u
ML2a m2a_out m2a_out vdd vdd pmos114 w=4.4u l=1u
ML2b m2b_out m2b_out vdd vdd pmos114 w=4.4u l=1u

*** Your Bias Circuitry here ***
*** nmos
*** drain gate source bulk mostype w_value l_value
Mbias1a iina nbias vss vss nmos114 w=2.2u l=2u
Mbias1b iinb nbias vss vss nmos114 w=2.2u l=2u
Mbias2a ibias2a nbias vss vss nmos114 w=2.2u l=2u
Mbias2b ibias2b nbias vss vss nmos114 w=2.2u l=2u
Mbias3a vouta nbias vss vss nmos114 w=7.6u l=2u
Mbias3b voutb nbias vss vss nmos114 w=7.6u l=2u

* *** Ideal Sources to be replaced later
* ** +term -term value
* I1a iina vss DC=75.0u
* I1b iinb vss DC=75.0u
* I2a ibias2a vss DC=32.8u
* I2b ibias2b vss DC=32.8u
* I3a vouta vss DC=172.2u
* I3b voutb vss DC=172.2u

** for students enrolled in ee114, you can use the given ideal voltage source
Vbias_n nbias vss 1.5   *replace --- by your value

** For students enrolled in ee214A, you need to design your bias ciruit. You cannpt use Vbias_n as ideal voltage source.



* defining the analysis

.op
.option post brief nomod

** For ac simulation uncomment the following line** 
.ac dec 100 100 10G
.measure ac gainmax max vdb(vouta)
.measure ac f3db when vdb(vouta)='gainmax-3'

** For transient simulation uncomment the following line **
*.tran 0.01u 4u 

.end
