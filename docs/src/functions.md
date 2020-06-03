# Functions

Functions provided in the package are listed below. To use other objective functions, ensure
that the new function takes in an argument of type `Vector{Float64}`, i.e. `Array{Float64, 1}`.
The function should also return a single value of type `Float64`.

For example, if you were to add in a new function called `sphere`, the function
can be written as follows:

```julia
function sphere(x::Vector{Float64})
    return sum(x.^2)
end
```

```@docs
sphere(x::Vector{Float64})
```

```@docs
sumsquare(x::Vector{Float64})
```

```@index
Pages = ["functions.md"]
```
