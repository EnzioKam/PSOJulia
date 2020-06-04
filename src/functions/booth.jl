"""
    booth(x)

Evaluates the beale function on the vector x of length 2 and returns the value.
```math
f(x) = (x_1 + 2x_2 - 7)^2 + (2x_1 + x_2 - 5)^2
```

The global minimum ``f(x) = 0`` is attained at ``x = (1, 3)``. The
recommended bounds are ``-10 \\leq x_i \\leq 10``.

# Examples
```jldoctest
julia> booth([1.0; 2.0])
5.0
```
"""
function booth(x::Vector{Float64})
    @assert length(x) == 2 "booth can only take in Vector{Float64} of length 2."
    x1, x2 = x
    return (x1 + 2 * x2 - 7)^2 + (2 * x1 + x2 - 5)^2
end