using Random

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
    pbestvalue = zeros(en)
    stag = 0 # seems redundant
    stagmax = N # seems redundant
    iternum = 1
    for i = 1:en
        pbestvalue[i] = fobj(pbest[:, i])
    end

    glbestvalue, ind = findmin(pbestvalue)
    glbest = Matrix{Float64}(undef, n, N)
    glbest[:, iternum] = pbest[:, ind]
    histvalue = zeros(N+1)

    while iternum < N
        histvalue[iternum] = glbestvalue

        for i = 1:en
            inertia = (1 - eta*w) * V[:,i]
            change = eta * (c1 * u1(n, 1).*(X[:, i, iternum] - pbest[:,i]) + c2 * u2(n, 1).*(X[:,i,iternum] - glbest[:,iternum]))
            noise = sig * eta * randn(n, 1)
            V[:, i] = inertia - change + noise
            xposu = X[:, i, iternum] + eta * V[:, i]
            xpos = max.(min.(up, xposu), lb);

            X[:, i, iternum + 1] = xpos
            fval = fobj(xpos)

            if fval < pbestvalue[i]
                pbest[:, i] = xpos
                pbestvalue[i] = fval
            end
        end

        iternum += 1
        glbest[:, iternum] = glbest[:, iternum - 1];
        fbest, ind = findmin(pbestvalue)
        if fbest < glbestvalue
            glbest[:, iternum] = pbest[:, ind];
            glbestvalue = fbest;
        end

        if iternum == allN[tp] - 1
            bestvaluerec[tp] = glbestvalue
            bestposrec[:, tp] = glbest[:, iternum]
            tp = min(tp + 1, sizeN)
        end
    end

    histvalue[iternum] = glbestvalue
    return bestvaluerec, glbest # values, positions
end
