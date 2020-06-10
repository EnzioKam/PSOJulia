# Functions

## Defining new functions

To use objective functions other than the ones provided in this package, ensure
that the new function takes in an argument of type `Vector{Float64}`, i.e. `Array{Float64, 1}`.
The function should also return a single value of type `Float64`.

For example, if you were to add in a new function called `objective`, the function
can be written as follows:

```julia
function objective(x::Vector{Float64})
    return sum(x.^2)
end
```

Note that the new function should work on all sizes of `Vector` other than empty vectors unless otherwise stated.
In this case, you should add in an assertion to ensure that the input will conform to the required size.

## List of available functions

The function definitions and other information are taken with reference from Ab Wahab et. al[^1]
and Surjanovic and Bingham[^2]. A total of 30 functions from the package are listed below.

[^1]: Ab Wahab MN, Nefti-Meziani S, Atyabi A (2015) A Comprehensive Review of Swarm Optimization Algorithms. *PLoS ONE* 10(5): e0122827. https://doi.org/10.1371/journal.pone.0122827
[^2]: Surjanovic, S. & Bingham, D. (2013). Virtual Library of Simulation Experiments: Test Functions and Datasets. Retrieved June 4, 2020, from http://www.sfu.ca/~ssurjano.

```@index
Pages = ["functions.md"]
```

```@autodocs
Modules = [PSOJulia]
Pages = ["ackley.jl", "beale.jl", "bohachevsky1.jl", "bohachevsky2.jl", "bohachevsky3.jl",
    "booth.jl", "branin.jl", "bukin6.jl", "colville.jl", "dixonprice.jl", "dropwave.jl",
    "easom.jl", "eggholder.jl", "goldsteinprice.jl", "griewank.jl", "matyas.jl", "mccormick.jl",
    "michalewicz5.jl", "perm.jl", "powell.jl", "rastrigin.jl", "rosenbrock.jl", "schaffer2.jl",
    "schaffer4.jl", "schwefel.jl", "shubert.jl", "sphere.jl", "sumsquare.jl", "trid6.jl", "zakharov.jl"]
```