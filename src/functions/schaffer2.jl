"""
    schaffer2(x)

Evaluates the schaffer2 function on the vector x of length 2 and returns the value.
```math
f(x) = 0.5 + \\frac{\\sin^2(x_1^2 - x_2^2) - 0.5}{(1 + 0.0001(x_1^2 + x_2^2))^2}
```

The global minimum ``f(x) = 0`` is attained at ``x = (0, 0)``. The
recommended bounds are ``-100 \\leq x_i \\leq 100``.

# Examples
```jldoctest
julia> schaffer2([1.0; 2.0])
0.020394581994177263
```
"""
function schaffer2(x::Vector{Float64})
    @assert length(x) == 2 "schaffer2 can only take in Vector{Float64} of length 2."
    x1, x2 = x
    return 0.5 + (sin(x1^2 - x2^2)^2 - 0.5) / (1 + 0.0001 * (x1^2 + x2^2))^2
end