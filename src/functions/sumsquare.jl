"""
    sumsquare(x)

Evaluates the sumsquare function on the vector x and returns the value.
```math
f(x) = \\sum_{i=1}^d ix_i^2
```
The global minimum ``f(x) = 0`` is attained at ``x = (0, ... , 0)``. The
recommended bounds are ``-5.12 \\leq x_i \\leq 5.12``.

# Examples
```jldoctest
julia> sumsquare([1.0; 2.0; 3.0; 4.0])
100
```
"""
function sumsquare(x::Vector{Float64})
    a = 1:length(x)
    return a' * x.^2
end