using PSOJulia, BenchmarkTools

allN = [10, 50, 100, 200, 400, Int(1e3), Int(3e3), Int(1e4)]
w = 1 - 0.729
c1 = 1.5
c2 = 1.5
en = 32
u1 = rand
u2 = rand
eta = 0.1
sig = 0.5

fobj = sphere

dim = 5
lb, up = -100.0, 100.0
A, B = matrix_bound(lb, up, en, dim)

@benchmark sPSO($(generate_particles(A, B)), $(generate_velocities(A, B)), 
                w, c1, c2, u1, u2, eta, sig, fobj, allN, up, lb)
