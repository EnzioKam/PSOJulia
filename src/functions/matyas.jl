"""
    matyas(x)

Evaluates the matyas function on the vector x of length 2 and returns the value.
```math
f(x) = 0.26(x_1^2 + x_2^2) - 0.48 x_1 x_2
```

The global minimum ``f(x) = 0`` is attained at ``x = (0, 0)``. The
recommended bounds are ``-10 \\leq x_i \\leq 10``.

# Examples
```jldoctest
julia> matyas([1.0; 2.0])
0.3400000000000001
```
"""
function matyas(x::Vector{Float64})
    @assert length(x) == 2 "matyas can only take in Vector{Float64} of length 2."
    return 0.26*sum(x.^2) - 0.48*prod(x)
end