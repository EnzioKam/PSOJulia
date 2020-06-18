using Random, Statistics

"""
    sPSO(X_initial, V_initial, w, c1, c2, u1, u2, eta, sig, fobj, allN, up, lb)

Runs the smoothed Particle Swarm Optimisation algorithm on the list of inputs.
The function returns a vector of recorded global best value estimates, and a matrix
of their corresponding positions.

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
- `up`: scalar / vector of upper bounds for each dimension
- `lb`: scalar / vector of lower bounds for each dimension

# Examples
```jldoctest
julia> allN = [10, 50, 100, 200, 400, Int(1e3), Int(3e3), Int(1e4)];
julia> w = 1 - 0.729;
julia> c1 = 1.5;
julia> c2 = 1.5;
julia> en = 32;
julia> u1 = rand;
julia> u2 = rand;
julia> eta = 0.1;
julia> sig = 0.5;
julia> fobj = sphere;
julia> dim = 5;
julia> lb, up = -100.0, 100.0;
julia> A, B = matrix_bounds(lb, up, en, dim);
julia> v, p = sPSO(generate_particles(lb, up, en, dim), generate_velocities(lb, up, en, dim), 
                    w, c1, c2, u1, u2, eta, sig, fobj, allN, up, lb);
```
"""
function sPSO(X_initial::Matrix{Float64}, V_initial::Matrix{Float64}, w::Float64, c1::Float64,
                c2::Float64, u1, u2, eta::Float64, sig::Float64, fobj, allN::Vector{Int64}, up, lb)
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
        cognitive = eta * c1 * u1(n, 1).*(pbest - X_current)
        social = eta * c2 * u2(n, 1).*(view(glbest, :, iternum) .- X_current)
        noise = sig * eta * randn(n, en)
        V = inertia + cognitive + social + noise
        Xposu = X_current +  V
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
function PSO(X_initial::Matrix{Float64}, V_initial::Matrix{Float64}, w::Float64, c1::Float64,
            c2::Float64, u1, u2, fobj, allN::Vector{Int64}, up, lb)
    return sPSO(X_initial, V_initial, w, c1, c2, u1, u2, 1., 0., fobj, allN, up, lb)
end

"""
    CSO(fobj, allN, separable, up, lb)

Runs the Competitive Swarm Optimiser algorithm on the list of inputs.
The function returns a vector of recorded global best value estimates, and a matrix
of their corresponding positions.

# Arguments
- `fobj`: objective function to be optimised
- `allN`: list of iteration numbers to record results at
- `separable`: boolean of whether fobj is a separable function
- `up`: scalar / vector of upper bounds for each dimension
- `lb`: scalar / vector of lower bounds for each dimension

# Examples
```jldoctest
julia> allN = [10, 50, 100, 200, 400, Int(1e3), Int(3e3), Int(1e4)];
julia> fobj = sphere;
julia> separable = true;
julia> up = fill(100., 5)
julia> lb = -up
julia> v = CSO(fobj, allN, separable, up, lb);
```
"""
function CSO(fobj, allN::Vector{Int64}, separable::Bool, up, lb)
    sizeN = length(allN)
    N = allN[end]
    bestvaluerec = zeros(sizeN, 1)
    tp = 1
    N -= 1
    n = length(up)

    if separable
        if n >= 2000
            phi = 0.2;
        elseif n >= 1000
            phi = 0.15;
        elseif n >=500
            phi = 0.1;
        else
            phi = 0;
        end
    else
        if n >= 2000
            phi = 0.2;
        elseif n >= 1000
            phi = 0.1;
        elseif n >=500
            phi = 0.05;
        else
            phi = 0;
        end
    end

    if n >= 5000
        m = 1500;
    elseif n >= 2000
        m = 1000;
    elseif n >= 1000
        m = 500;
    elseif n >= 500
        m = 250;
    else
        m = 100;
    end

    A, B = matrix_bound(lb, up, m, n)
    p = generate_particles(A, B)
    fitness = mapslices(fobj, p, dims=1)
    v = zeros(Float64, n, m)
    glbestvalue = Inf
    FES = 0
    iternum = 1
    rlist = collect(1:m)
    pair1 = Vector{Float64}(undef, m÷2)
    pair2 = Vector{Float64}(undef, m÷2)
    center = Vector{Float64}(undef, n)
    mask = Vector{Float64}(undef, m÷2)
    losers = Vector{Float64}(undef, m÷2)
    winners = Vector{Float64}(undef, m÷2)
    randco1 = Matrix{Float64}(undef, n, m÷2)
    randco2 = Matrix{Float64}(undef, n, m÷2)
    randco3 = Matrix{Float64}(undef, n, m÷2)

    while iternum <= N
        shuffle!(rlist)
        pair1 = rlist[1:m÷2]
        pair2 = rlist[m÷2 + 1:m]
        
        center = mean(p, dims=2)

        mask = fitness[pair1] .> fitness[pair2]
        losers = mask.*pair1 + .~mask.*pair2
        winners = .~mask.*pair1 + mask.*pair2

        randco1 = rand(n, m÷2)
        randco2 = rand(n, m÷2)
        randco3 = rand(n, m÷2)
        
        # Create views
        plosers = view(p, :, losers)
        pwinners = view(p, :, winners)
        vlosers = view(v, :, losers)

        v[:, losers] = randco1.*vlosers + randco2.*(pwinners - plosers) + phi*randco3.*(center .- plosers)
        p[:, losers] += vlosers
        p[:, losers] = max.(min.(up, plosers), lb)

        # v[:, losers] = randco1.*v[:,losers] + randco2.*(p[:,winners] - p[:,losers]) + phi*randco3.*(center .- p[:,losers])
        # p[:, losers] += v[:, losers]
        # p[:, losers] = max.(min.(up, p[:, losers]), lb)

        fitness[losers] = mapslices(fobj, p[:, losers], dims=1)
        glbestvalue = min(glbestvalue, minimum(fitness))
        FES += m ÷ 2
        
        iternum += 1

        if iternum == allN[tp] - 1
            bestvaluerec[tp] = glbestvalue
            tp = min(tp + 1, sizeN)
        end
    end

    return bestvaluerec
end