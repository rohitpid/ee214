v 20110115 2
C 40000 40000 0 0 0 title-B.sym
C 47400 49600 1 0 0 vdd-1.sym
C 47800 42900 1 180 0 vss-1.sym
C 47800 42900 1 180 0 vss-1.sym
C 47800 42900 1 180 0 vss-1.sym
C 47300 46100 1 0 1 diode-1.sym
{
T 46900 46700 5 10 0 0 0 6 1
device=DIODE
T 47000 46600 5 10 1 1 0 6 1
refdes=iina
}
C 46900 48800 1 0 1 pmos-2.sym
{
T 46200 49000 5 10 0 0 0 6 1
device=PMOS_TRANSISTOR
T 47200 49300 5 10 1 1 0 6 1
netname=ML1a
}
C 44500 48800 1 0 0 pmos-2.sym
{
T 45200 49000 5 10 0 0 0 0 1
device=PMOS_TRANSISTOR
T 43900 49300 5 10 1 1 0 0 1
netname=ML2a
T 43700 49100 5 10 1 1 0 0 1
footprint=W=1 L=1
}
C 46900 47300 1 0 1 nmos-2.sym
{
T 46300 47800 5 10 0 0 0 6 1
device=NMOS_TRANSISTOR
T 46500 48000 5 10 1 1 0 0 1
netname=M1a
}
C 45000 47800 1 0 1 nmos-2.sym
{
T 44400 48300 5 10 0 0 0 6 1
device=NMOS_TRANSISTOR
T 44600 47700 5 10 1 1 0 0 1
netname=M2a
}
C 47500 47400 1 0 0 gnd-1.sym
N 44500 47900 44500 45200 4
N 43100 48100 43100 45200 4
N 43100 48900 43100 49600 4
N 43100 49600 55200 49600 4
N 46400 47300 46400 45200 4
N 44500 49200 44500 48600 4
N 44500 48600 45000 48600 4
N 45000 48600 45000 48800 4
N 46400 48100 46400 48800 4
N 46400 48600 46900 48600 4
N 46900 48600 46900 49200 4
C 47900 46100 1 0 0 diode-1.sym
{
T 48300 46700 5 10 0 0 0 0 1
device=DIODE
T 48200 46600 5 10 1 1 0 0 1
refdes=iinb
}
C 48300 48800 1 0 0 pmos-2.sym
{
T 49000 49000 5 10 0 0 0 0 1
device=PMOS_TRANSISTOR
T 48900 49300 5 10 1 1 0 0 1
netname=ML1b
}
C 50700 48800 1 0 1 pmos-2.sym
{
T 50000 49000 5 10 0 0 0 6 1
device=PMOS_TRANSISTOR
T 50600 49300 5 10 1 1 0 0 1
netname=ML2b
}
C 48300 47300 1 0 0 nmos-2.sym
{
T 48900 47800 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 48400 48000 5 10 1 1 0 0 1
netname=M1b
}
C 50200 47800 1 0 0 nmos-2.sym
{
T 50800 48300 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 50200 47800 5 10 1 1 0 0 1
netname=M2b
}
N 50700 47900 50700 45200 4
N 52100 48900 52100 49600 4
N 48800 47300 48800 45200 4
N 50700 49200 50700 48600 4
N 50700 48600 50200 48600 4
N 50200 48600 50200 48800 4
N 48800 48100 48800 48800 4
N 48800 48600 48300 48600 4
N 48300 48600 48300 49200 4
N 52100 48100 52100 45200 4
N 44500 48500 43600 48500 4
N 50700 48500 51600 48500 4
N 45000 48200 46400 48200 4
N 50300 48200 48800 48200 4
N 44500 47000 50700 47000 4
N 43600 44800 43600 45600 4
N 45000 45600 45000 44800 4
N 46900 45600 46900 44800 4
N 48300 44800 48300 45600 4
N 50200 45600 50200 44800 4
N 51600 45600 51600 44800 4
N 46800 47700 48300 47700 4
C 54700 42900 1 0 0 nmos-2.sym
{
T 55300 43400 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 55500 43500 5 10 1 1 0 0 1
netname=Ml
T 55500 43200 5 10 1 1 0 0 1
footprint=W=2 L=2
T 55300 42900 5 10 1 1 0 0 1
overvoltage=Vov=1.0224V
}
C 54700 43900 1 0 0 nmos-2.sym
{
T 55300 44400 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 55500 44500 5 10 1 1 0 0 1
netname=Mu
T 55500 44200 5 10 1 1 0 0 1
footprint=W=2 L=2
T 55400 43900 5 10 1 1 0 0 1
overvoltage=Vov=665mV
}
N 55200 43600 55200 43900 4
N 54700 44300 54600 44300 4
N 54600 44300 54600 45600 4
N 55200 44700 55200 47600 4
C 51600 48100 1 0 0 nmos-2.sym
{
T 52200 48600 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 51600 48100 5 10 1 1 0 0 1
netname=M3b
}
C 43600 48900 1 180 0 nmos-2.sym
{
T 43000 48400 5 10 0 0 180 0 1
device=NMOS_TRANSISTOR
T 43200 48000 5 10 1 1 0 0 1
netname=M3a
T 43200 47800 5 10 1 1 0 0 1
footprint=W=1 L=1
}
C 51600 44400 1 0 0 nmos-2.sym
{
T 52200 44900 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 51400 44300 5 10 1 1 0 0 1
netname=Mbias3b
}
C 50200 44400 1 0 0 nmos-2.sym
{
T 50800 44900 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 50000 44300 5 10 1 1 0 0 1
netname=Mbias2b
}
C 46900 44400 1 0 1 nmos-2.sym
{
T 46300 44900 5 10 0 0 0 6 1
device=NMOS_TRANSISTOR
T 46500 44300 5 10 1 1 0 0 1
netname=Mbias1a
}
C 45000 44400 1 0 1 nmos-2.sym
{
T 44400 44900 5 10 0 0 0 6 1
device=NMOS_TRANSISTOR
T 44800 44400 5 10 1 1 0 0 1
netname=Mbias2a
}
C 43600 44400 1 0 1 nmos-2.sym
{
T 43000 44900 5 10 0 0 0 6 1
device=NMOS_TRANSISTOR
T 43400 44400 5 10 1 1 0 0 1
netname=Mbias3a
}
C 48300 44400 1 0 0 nmos-2.sym
{
T 48900 44900 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 48000 44300 5 10 1 1 0 0 1
netname=Mbias1b
}
N 54600 43300 54600 44400 4
N 43100 44400 43100 42900 4
N 43100 42900 55200 42900 4
N 44500 44400 44500 42900 4
N 46400 44400 46400 42900 4
N 52100 44400 52100 42900 4
C 55100 48500 1 270 0 resistor-1.sym
{
T 55500 48200 5 10 0 0 270 0 1
device=RESISTOR
T 55400 48300 5 10 1 1 270 0 1
refdes=R=140k
}
N 55200 49600 55200 48500 4
C 47800 46300 1 180 0 vdd-1.sym
N 47300 46300 47900 46300 4
L 43300 43800 43300 43100 3 0 0 0 -1 -1
L 43300 43100 43400 43300 3 0 0 0 -1 -1
L 43300 43100 43200 43300 3 0 0 0 -1 -1
B 54300 42400 2200 7700 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 54500 49800 9 10 1 0 0 0 1
Bias Generator Circuit
N 43600 45600 54600 45600 4
N 48800 44400 48800 42900 4
N 50700 44500 50700 42900 4
T 43200 43900 9 10 1 0 0 0 1
I3a
L 44800 43800 44800 43100 3 0 0 0 -1 -1
L 44800 43100 44900 43300 3 0 0 0 -1 -1
L 44800 43100 44700 43300 3 0 0 0 -1 -1
T 44700 43900 9 10 1 0 0 0 1
I2a
L 46600 43800 46600 43100 3 0 0 0 -1 -1
L 46600 43100 46700 43300 3 0 0 0 -1 -1
L 46600 43100 46500 43300 3 0 0 0 -1 -1
T 46500 43900 9 10 1 0 0 0 1
I1a
L 48600 43800 48600 43100 3 0 0 0 -1 -1
L 48600 43100 48700 43300 3 0 0 0 -1 -1
L 48600 43100 48500 43300 3 0 0 0 -1 -1
T 48500 43900 9 10 1 0 0 0 1
I1b
L 50500 43800 50500 43100 3 0 0 0 -1 -1
L 50500 43100 50600 43300 3 0 0 0 -1 -1
L 50500 43100 50400 43300 3 0 0 0 -1 -1
T 50400 43900 9 10 1 0 0 0 1
I2b
L 51900 43800 51900 43100 3 0 0 0 -1 -1
L 51900 43100 52000 43300 3 0 0 0 -1 -1
L 51900 43100 51800 43300 3 0 0 0 -1 -1
T 51800 43900 9 10 1 0 0 0 1
I3b
B 41000 42400 11400 3400 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 41300 45600 9 10 1 0 0 0 1
Bias Current Circuit
T 43200 47600 8 10 1 1 0 0 1
overvoltage=Vov3
C 41700 46600 1 90 0 resistor-1.sym
{
T 41300 46900 5 10 0 0 90 0 1
device=RESISTOR
T 41400 46800 5 10 1 1 90 0 1
refdes=5k
}
C 42500 46600 1 90 0 capacitor-1.sym
{
T 41800 46800 5 10 0 0 90 0 1
device=CAPACITOR
T 42000 46800 5 10 1 1 90 0 1
refdes=1000fF
T 41600 46800 5 10 0 0 90 0 1
symversion=0.1
}
N 43100 47500 41600 47500 4
{
T 41400 47700 5 10 1 1 0 0 1
netname=Vout_a
}
C 41900 46200 1 0 0 gnd-1.sym
N 41600 46500 42300 46500 4
N 42300 46500 42300 46600 4
C 53500 46600 1 270 1 resistor-1.sym
{
T 53900 46900 5 10 0 0 90 2 1
device=RESISTOR
T 53800 46800 5 10 1 1 90 2 1
refdes=5k
}
C 52700 46600 1 270 1 capacitor-1.sym
{
T 53400 46800 5 10 0 0 90 2 1
device=CAPACITOR
T 53200 46800 5 10 1 1 90 2 1
refdes=1000fF
T 53600 46800 5 10 0 0 90 2 1
symversion=0.1
}
C 53300 46200 1 0 1 gnd-1.sym
N 53600 46500 52900 46500 4
N 52900 46500 52900 46600 4
N 52100 47500 53600 47500 4
{
T 53100 47700 5 10 1 1 0 0 1
netname=Vout_b
}
T 53900 40200 9 10 1 0 0 0 1
Rohit Pidaparthi & Sam Fok
T 50300 40900 9 10 1 0 0 0 1
3 Stage Amplifier Design Project
T 50800 40100 9 10 1 0 0 0 1
1
T 51900 40100 9 10 1 0 0 0 1
1
