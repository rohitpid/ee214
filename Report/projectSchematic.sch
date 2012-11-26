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
T 47500 49300 5 10 1 1 0 6 1
netname=ML1a
T 47000 49100 5 10 1 1 0 0 1
footprint=W=2.4 L=1
T 47000 48900 5 10 1 1 0 0 1
overvoltage=Vov=-894mV
}
C 44500 48800 1 0 0 pmos-2.sym
{
T 45200 49000 5 10 0 0 0 0 1
device=PMOS_TRANSISTOR
T 43900 49300 5 10 1 1 0 0 1
netname=ML2a
T 43600 49100 5 10 1 1 0 0 1
footprint=W=2.8 L=1
T 43400 48900 5 10 1 1 0 0 1
overvoltage=Vov=-894mV
}
C 46900 47300 1 0 1 nmos-2.sym
{
T 46300 47800 5 10 0 0 0 6 1
device=NMOS_TRANSISTOR
T 46800 48200 5 10 1 1 0 0 1
netname=M1a
T 46600 48000 5 10 1 1 0 0 1
footprint=W=14.2 L=1
T 46500 47200 5 10 1 1 0 0 1
overvoltage=Vov=267mV
}
C 45000 47800 1 0 1 nmos-2.sym
{
T 44400 48300 5 10 0 0 0 6 1
device=NMOS_TRANSISTOR
T 44600 47700 5 10 1 1 0 0 1
netname=M2a
T 44600 47400 5 10 1 1 0 0 1
footprint=W=6.8 L=1
T 44600 47100 5 10 1 1 0 0 1
overvoltage=Vov=267mV
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
T 48900 48900 5 10 1 1 0 0 1
footprint=W=2.4 L=1
T 48900 48700 5 10 1 1 0 0 1
overvoltage=Vov=-894mV
}
C 50700 48800 1 0 1 pmos-2.sym
{
T 50000 49000 5 10 0 0 0 6 1
device=PMOS_TRANSISTOR
T 50800 49300 5 10 1 1 0 0 1
netname=ML2b
T 50800 49100 5 10 1 1 0 0 1
footprint=W=2.8 L=1
T 50800 48900 5 10 1 1 0 0 1
overvoltage=Vov=-894mV
}
C 48300 47300 1 0 0 nmos-2.sym
{
T 48900 47800 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 48000 48200 5 10 1 1 0 0 1
netname=M1b
T 47700 48000 5 10 1 1 0 0 1
footprint=W=14.2 L=1
T 47800 47200 5 10 1 1 0 0 1
overvoltage=Vov=267mV
}
C 50200 47800 1 0 0 nmos-2.sym
{
T 50800 48300 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 50000 47800 5 10 1 1 0 0 1
netname=M2b
T 49800 47500 5 10 1 1 0 0 1
footprint=W=6.8 L=1
T 49700 47200 5 10 1 1 0 0 1
overvoltage=Vov=404mV
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
T 52400 48900 5 10 1 1 0 0 1
netname=M3b
T 52400 48600 5 10 1 1 0 0 1
footprint=W=40.2 L=1
T 52400 48300 5 10 1 1 0 0 1
overvoltage=Vov=253mV
}
C 43600 48900 1 180 0 nmos-2.sym
{
T 43000 48400 5 10 0 0 180 0 1
device=NMOS_TRANSISTOR
T 43200 48000 5 10 1 1 0 0 1
netname=M3a
T 43200 47800 5 10 1 1 0 0 1
footprint=W=1 L=1
T 43200 47600 5 10 1 1 0 0 1
overvoltage=Vov=404mV
}
C 51600 44400 1 0 0 nmos-2.sym
{
T 52200 44900 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 52600 44500 5 10 1 1 0 0 1
netname=Mbias3b
T 52500 44300 5 10 1 1 0 0 1
footprint=W=5.6 L=1
T 52500 44100 5 10 1 1 0 0 1
overvoltage=Vov=1.0224
}
C 50200 44400 1 0 0 nmos-2.sym
{
T 50800 44900 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 50900 44500 5 10 1 1 0 0 1
netname=Mbias2b
T 50900 44300 5 10 1 1 0 0 1
footprint=W=2.2 L=1
T 50900 44100 5 10 1 1 0 0 1
overvoltage=Vov=1.0224
}
C 46900 44400 1 0 1 nmos-2.sym
{
T 46300 44900 5 10 0 0 0 6 1
device=NMOS_TRANSISTOR
T 46800 44500 5 10 1 1 0 0 1
netname=Mbias1a
T 46800 44300 5 10 1 1 0 0 1
footprint=W=2.2 L=1
T 46800 44100 5 10 1 1 0 0 1
overvoltage=Vov=1.0224V
}
C 45000 44400 1 0 1 nmos-2.sym
{
T 44400 44900 5 10 0 0 0 6 1
device=NMOS_TRANSISTOR
T 44900 44500 5 10 1 1 0 0 1
netname=Mbias2a
T 44900 44300 5 10 1 1 0 0 1
footprint=W=2.2 L=2
T 44900 44100 5 10 1 1 0 0 1
overvoltage=Vov=1.0224V
}
C 43600 44400 1 0 1 nmos-2.sym
{
T 43000 44900 5 10 0 0 0 6 1
device=NMOS_TRANSISTOR
T 43400 44500 5 10 1 1 0 0 1
netname=Mbias3a
T 43400 44300 5 10 1 1 0 0 1
footprint=W=5.6 L=2
T 43400 44100 5 10 1 1 0 0 1
overvoltage=Vov=1.0224V
}
C 48300 44400 1 0 0 nmos-2.sym
{
T 48900 44900 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 49100 44500 5 10 1 1 0 0 1
netname=Mbias1b
T 49100 44300 5 10 1 1 0 0 1
footprint=W=2.2 L=1
T 49100 44100 5 10 1 1 0 0 1
overvoltage=Vov=1.0224
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
I3a=81.68uA
L 44700 43800 44700 43100 3 0 0 0 -1 -1
L 44700 43100 44800 43300 3 0 0 0 -1 -1
L 44700 43100 44600 43300 3 0 0 0 -1 -1
T 44600 43900 9 10 1 0 0 0 1
I2a=31.84uA
L 46600 43700 46600 43000 3 0 0 0 -1 -1
L 46600 43000 46700 43200 3 0 0 0 -1 -1
L 46600 43000 46500 43200 3 0 0 0 -1 -1
T 46500 43800 9 10 1 0 0 0 1
I1a=30.73uA
L 49000 43700 49000 43000 3 0 0 0 -1 -1
L 49000 43000 49100 43200 3 0 0 0 -1 -1
L 49000 43000 48900 43200 3 0 0 0 -1 -1
T 48900 43800 9 10 1 0 0 0 1
I1b=30.73uA
L 50900 43700 50900 43000 3 0 0 0 -1 -1
L 50900 43000 51000 43200 3 0 0 0 -1 -1
L 50900 43000 50800 43200 3 0 0 0 -1 -1
T 50800 43800 9 10 1 0 0 0 1
I2b=31.84uA
L 52300 43700 52300 43000 3 0 0 0 -1 -1
L 52300 43000 52400 43200 3 0 0 0 -1 -1
L 52300 43000 52200 43200 3 0 0 0 -1 -1
T 52200 43800 9 10 1 0 0 0 1
I3b=81.68uA
B 41000 42400 12600 3400 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 41300 45600 9 10 1 0 0 0 1
Bias Current Circuit
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
