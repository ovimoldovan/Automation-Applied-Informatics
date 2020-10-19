Hf = tf([2],conv([1 1], [10 1]),'iodelay',1)
bode(H)
db2mag(-4.36)
Hc = tf([21.28, 1.6], [13.3, 0])

H = Hf * Hc
H = feedback(H,1)

Hcz = c2d(H, 0.1, 'tustin')

Hfz = c2d(Hf,0.1,'tustin')

Hoz = feedback(Hcz * Hfz,1)
step(Hoz)
