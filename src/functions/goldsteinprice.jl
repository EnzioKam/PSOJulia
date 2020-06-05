"""
    goldsteinprice(x)

Evaluates the goldsteinprice function on the vector x of length 2 and returns the value.
```math
f(x) = \\left[1 + (x_1 + x_2 + 1)^2(19 - 14x_1 + 3x_1^2- 14x_2 + 6x_1x_2 + 3x_2^2)\\right] \\times \\\\
\\left[30 + (2x_1 - 3x_2)^2(18 - 32x_1 + 12x_1^2 + 4x_2 - 36x_1x_2 + 27x_2^2)\\right]
```

The global minimum ``f(x) = 3`` is attained at ``x = (0, -1)``. The
recommended bounds are ``-10 \\leq x_i \\leq 10``.

# Examples
```jldoctest
julia> goldsteinprice([1.0; 2.0])
137150.0
```
"""
function goldsteinprice(x::Vector{Float64})
    @assert length(x) == 2 "goldsteinprice can only take in Vector{Float64} of length 2."
    x1, x2  =  x
    t1 = (x1 + x2 + 1)^2
    t2 = 19 - 14 * x1 + 3 * x1^2 - 14 * x2 + 6 * x1 * x2 + 3 * x2^2
    t3 = (2 * x1 - 3 * x2)^2
    t4 = 18 - 32 * x1 + 12 * x1^2 + 48 * x2 - 36 * x1 * x2 + 27 * x2^2
    val = (1 + t1 * t2) * (30 + t3 * t4)
end