include("algorithm.jl")
include("utilities.jl")
include("functionlist.jl")

allN = [10, 50, 100, 200, 400, Int(1e3), Int(3e3), Int(1e4)]
w = 1 - 0.729
c1 = 1.5
c2 = 1.5
en = 32
u1 = rand
u2 = rand
eta = 1
sig = 0
rep = 100
dim = 5
# nall = [5,10,20,40]

fobj = sphere
lb = fill(-100, dim)
up = fill(100, dim)
A = repeat(lb, 1, en)
B = repeat(up, 1, en)
X_initial = generate_random_matrix(A, B)
V_initial = generate_random_matrix(-(B-A), B-A)

values, positions = sPSO(X_initial, V_initial, w, c1, c2, u1, u2, eta, sig, fobj, allN, up, lb)