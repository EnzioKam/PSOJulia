"""
Main module for `PSOJulia` -- a package to run the PSO and sPSO algorithms.

The package contains the code to run PSO, sPSO, and provides a sample list of
functions that can be used as objective functions.
"""
module PSOJulia

export sPSO, PSO
export generate_random_matrix
export ackley, beale, bohachevsky1, bohachevsky2, bohachevsky3, booth, branin,
    bukin6, colville, dixonprice, dropwave, sphere, sumsquare

include("algorithm.jl")
include("utilities.jl")
include("functionlist.jl")

end # module
