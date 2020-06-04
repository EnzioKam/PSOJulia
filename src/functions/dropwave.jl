"""
    dropwave(x)

Evaluates the beale function on the vector x of length 2 and returns the value.
```math
f(x) = - \\frac{1 + \\cos\\left( 12 \\sqrt{x_1^2 + x_2^2} \\right)}{0.5(x_1^2 + x_2^2) + 2}
```

The global minimum ``f(x) = -1`` is attained at ``x = (0, 0)``. The
recommended bounds are ``-5.12 \\leq x_i \\leq 5.12``.

# Examples
```jldoctest
julia> dropwave([1.0; 2.0])
-0.19357369461450374
```
"""
function dropwave(x::Vector{Float64})
    @assert length(x) == 2 "dropwave can only take in Vector{Float64} of length 2."
    x1, x2 = x
    sumsq = sum(x.^2)
    num = 1 + cos(12 * sqrt(sumsq))
    den = 0.5 * sumsq + 2
    return -1 * num / den
end