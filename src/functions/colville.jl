"""
    colville(x)

Evaluates the colville function on the vector x of length 4 and returns the value.
```math
f(x) = 100(x_1^2 - x_2)^2 + (x_1 - 1)^2 + (x_3 - 1)^2 + 90(x_3^2 - x_4)^2 + \\\\
10.1((x_2 - 1)^2 + (x_4 - 1)^2) + 19.8(x_2 - 1)(x_4 - 1)
```

The global minimum ``f(x) = 0`` is attained at ``x = (1, 1, 1, 1)``. The
recommended bounds are ``-10 \\leq x_i \\leq 10``.

# Examples
```jldoctest
julia> colville([1.0; 2.0; 3.0; 4.0])
2514.4
```
"""
function colville(x::Vector{Float64})
    @assert length(x) == 4 "colville can only take in Vector{Float64} of length 4."
    x1, x2, x3, x4 = x
    return 100 * (x1^2 - x2)^2 + (x1 - 1)^2 + (x3 - 1)^2 + 90 * (x3^2 - x4)^2 +
        10.1 * ((x2 - 1)^2 + (x4 - 1)^2) + 19.8 * (x2 - 1) * (x4 - 1)
end