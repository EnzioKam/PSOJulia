"""
    eggholder(x)

Evaluates the eggholder function on the vector x of length 2 and returns the value.
```math
f(x) = -(x_2 + 47) \\sin \\left( \\sqrt{\\left\\lvert x_2 + \\frac{x_1}{2} + 47 \\right\\rvert} \\right)
- x_1 \\sin \\left( \\sqrt{\\left\\lvert x_1 - (x_2 + 47) \\right\\rvert} \\right)
```

The global minimum ``f(x) = -959.6407`` is attained at ``x = (512, 404.2319)``. The
recommended bounds are ``-512 \\leq x_i \\leq 512``.

# Examples
```jldoctest
julia> eggholder([1.0; 2.0])
-34.08883356384574
```
"""
function eggholder(x::Vector{Float64})
    @assert length(x) == 2 "eggholder can only take in Vector{Float64} of length 2."
    x1, x2 = x
    t1 = -(x2 + 47) * sin(sqrt(abs(x2 + x1 / 2 + 47)))
    t2 = -x1 * sin(sqrt(abs(x1 - (x2 + 47))))
    return t1 + t2;
end