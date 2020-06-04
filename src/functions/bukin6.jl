"""
    bukin6(x)

Evaluates the beale function on the vector x of length 2 and returns the value.
```math
f(x) = 100 \\sqrt{\\lvert x_2 - 0.01x_1^2 \\rvert} + 0.01 \\lvert x_1 + 10 \\rvert
```

The global minimum ``f(x) = 0`` is attained at ``x = (-10, 1)``. The
recommended bounds are ``-15 \\leq x_1 \\leq -5, -3 \\leq x_2 \\leq 3``.

# Examples
```jldoctest
julia> bukin6([1.0; 2.0])
141.17735979665886
```
"""
function bukin6(x::Vector{Float64})
    @assert length(x) == 2 "bukin6 can only take in Vector{Float64} of length 2."
    x1, x2 = x
    return 100 * sqrt(abs(x2 - 0.01 * x1^2)) + 0.01 * abs(x1 + 10)
end