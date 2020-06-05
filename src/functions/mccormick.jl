"""
    mccormick(x)

Evaluates the mccormick function on the vector x of length 2 and returns the value.
```math
f(x) = \\sin(x_1 + x_2) + (x_1 - x_2)^2 - 1.5x_1 + 2.5x_2 + 1
```

The global minimum ``f(x) = -1.9133`` is attained at ``x = (-0.54719, -1.54719)``. The
recommended bounds are ``-1.5 \\leq x_1 \\leq 4, -3 \\leq x_2 \\leq 4``.

# Examples
```jldoctest
julia> mccormick([1.0; 2.0])
5.641120008059867
```
"""
function mccormick(x::Vector{Float64})
    @assert length(x) == 2 "mccormick can only take in Vector{Float64} of length 2."
    x1, x2 = x
    return sin(x1 + x2) + (x1 - x2)^2 - 1.5 * x1 + 2.5 * x2 + 1
end