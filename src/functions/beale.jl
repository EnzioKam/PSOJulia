"""
    beale(x)

Evaluates the beale function on the vector x of length 2 and returns the value.
```math
f(x) = (1.5 - x_1 + x_1 x_2)^2 + (2.25 - x_1 + x_1 x_2^2)^2 + (2.625 - x_1 + x_1 x_2^2)^2
```

The global minimum ``f(x) = 0`` is attained at ``x = (3, 0.5)``. The
recommended bounds are ``-4.5 \\leq x_i \\leq 4.5``.

# Examples
```jldoctest
julia> beale([1.0; 2.0])
126.935
```
"""
function beale(x::Vector{Float64})
    @assert length(x) == 2 "beale can only take in Vector{Float64} of length 2."
    x1, x2 = x
    return (1.5-x1+x1*x2)^2 + (2.25-x1+x1*x2^2)^2 + (2.65-x1+x1*x2^3)^2
end