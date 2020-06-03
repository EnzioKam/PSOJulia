"""
    sumsquare(x)

Evaluates the sumsquare function on the vector x and returns the value.
```math
f(x) = \\sum_{i=1}^d ix_i^2
```
The global minimum ``f(x) = 0`` is attained at ``x = (0, ... , 0)``.

# Examples
```jldoctest
julia> sumsquare([1;2;3;4])
100
```
"""
function sumsquare(x::Vector{Float64})
    a = 1:length(x)
    return a' * x.^2
end