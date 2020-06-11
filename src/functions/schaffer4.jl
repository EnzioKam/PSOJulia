"""
    schaffer4(x)

Evaluates the schaffer4 function on the vector x of length 2 and returns the value.
```math
f(x) = 0.5 + \\frac{\\cos^2(\\sin(\\lvert x_1^2 - x_2^2 \\rvert)) - 0.5}{(1 + 0.001(x_1^2 + x_2^2))^2}
```

The global minimum ``f(x) = 0.292579`` is attained at x = (0, 1.25313) or (0, -1.25313). The
recommended bounds are ``-100 \\leq x_i \\leq 100``.

# Examples
```jldoctest
julia> schaffer4([1.0; 2.0])
0.9754506010204307
```
"""
function schaffer4(x::Vector{Float64})
    @assert length(x) == 2 "schaffer4 can only take in Vector{Float64} of length 2."
    x1, x2 = x
    return 0.5 + (cos(sin(abs(x1^2 - x2^2)))^2 - 0.5) / (1 + 0.001 * (x1^2 + x2^2))^2
end