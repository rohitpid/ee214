function gain = gainAudit(gmL1, gm2, gmL2, gm3, gmb3, RL)

RL1 = 1 / gmL1
Av2 = gm2 / gmL2
Av3 = gm3 / (gm3 + 1 / RL + gmb3)

gain = RL1 * Av2 * Av3
gain_dB = 20 * log10(gain)
