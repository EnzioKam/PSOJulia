"""
    easom(x)

Evaluates the easom function on the vector x of length 2 and returns the value.
```math
f(x) = -\\cos(x_1) \\cos(x_2) \\exp \\left( -(x_1 - \\pi)^2 - (x_2 - \\pi)^2 \\right)
```

The global minimum ``f(x) = -1`` is attained at ``x = (\\pi, \\pi)``. The
recommended bounds are ``-30 \\leq x_i \\leq 30``.

# Examples
```jldoctest
julia> easom([1.0; 2.0])
0.0006223571340136757
```
"""
function easom(x::Vector{Float64})
    @assert length(x) == 2 "easom can only take in Vector{Float64} of length 2."
    return -1 * prod(cos.(x)) * exp(-1 * sum((x .- pi).^2))
end