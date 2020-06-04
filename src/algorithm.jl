using Random

"""
    sPSO(X_initial, V_initial, w, c1, c2, u1, u2, eta, sig, fobj, allN, up, lb)

Runs the smoothed Particle Swarm Optimisation algorithm on the list of inputs.
The function returns a vector of recorded global best value estimates, and a matrix
of their corresponding positions.

...
# Arguments
- `X_initial`: matrix of initial starting particle positions
- `V_initial`: matrix of initial starting particle velocities
- `w`: the intertia weight parameter
- `c1`: the cognitive acceleration coefficient
- `c2`: the social acceleration coefficient
- `u1`: function for random variable generation for cognitive term
- `u2`: function for random variable generation for social term
- `eta`: step size parameter
- `sig`: standard deviation parameter
- `fobj`: objective function to be optimised
- `allN`: list of iteration numbers to record results at
- `up`: vector of upper bounds for each dimension
- `lb`: vector of lower bounds for each dimension
...

# Examples
```jldoctest
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

fobj = sphere
lb = fill(-100, dim)
up = fill(100, dim)
A = repeat(lb, 1, en)
B = repeat(up, 1, en)
X_initial = generate_random_matrix(A, B)
V_initial = generate_random_matrix(-(B-A), B-A)

values, positions = sPSO(X_initial, V_initial, w, c1, c2, u1, u2, eta, sig, fobj, allN, up, lb)
```
"""
function sPSO(X_initial, V_initial, w, c1, c2, u1, u2, eta, sig, fobj, allN, up, lb)
    sizeN = length(allN)
    N = allN[end]
    bestvaluerec = zeros(sizeN, 1)
    tp = 1
    N -= 1 # Maximum number of iterations
    n, en = size(X_initial) # dimension, number of particles
    X = zeros(n, en, N)
    X[:,:,1] = X_initial
    V = V_initial
    pbest = X_initial
    bestposrec = zeros(n, sizeN)
    iternum = 1
    pbestvalue = mapslices(fobj, X_initial, dims=1)

    glbestvalue, ind = findmin(pbestvalue)
    glbest = Matrix{Float64}(undef, n, N)
    glbest[:, iternum] = pbest[:, ind[2]]
    histvalue = zeros(N+1)

    while iternum < N
        histvalue[iternum] = glbestvalue

        inertia = (1 - eta*w) * V
        X_current = view(X, :, :, iternum)
        social = eta * c1 * u1(n, 1).*(X_current - pbest)
        cognitive = eta * c2 * u2(n, 1).*(X_current .- view(glbest, :, iternum))
        noise = sig * eta * randn(n, en)
        V = inertia - social - cognitive + noise
        Xposu = X_current + eta * V
        Xpos = max.(min.(up, Xposu), lb)

        X[:, :, iternum + 1] = Xpos
        fval = mapslices(fobj, Xpos, dims=1)

        cond = fval .< pbestvalue
        for i = 1:en
            if cond[i]
                pbest[:, i] = view(Xpos, :, i)
                pbestvalue[i] = fval[i]
            end
        end

        iternum += 1
        fbest, ind = findmin(pbestvalue)
        if fbest < glbestvalue
            glbest[:, iternum] = pbest[:, ind[2]];
            glbestvalue = fbest;
        else
            glbest[:, iternum] = glbest[:, iternum - 1]
        end

        if iternum == allN[tp] - 1
            bestvaluerec[tp] = glbestvalue
            bestposrec[:, tp] = glbest[:, iternum]
            tp = min(tp + 1, sizeN)
        end
    end

    histvalue[iternum] = glbestvalue
    return bestvaluerec, bestposrec # values, positions
end


"""
    PSO(X_initial, V_initial, w, c1, c2, u1, u2, fobj, allN, up, lb)

Wrapper function that calls sPSO with eta=1 and sig=0. See [`sPSO`](@ref).
"""
function PSO(X_initial, V_initial, w, c1, c2, u1, u2, fobj, allN, up, lb)
    return sPSO(X_initial, V_initial, w, c1, c2, u1, u2, 1, 0, fobj, allN, up, lb)
end
