"""
    dixonprice(x)

Evaluates the dixonprice function on the vector x and returns the value.
```math
f(x) = (x_1 - 1)^2 + \\sum_{i=1}^n i(2x_i^2 - x_{i-1})^2
```

The global minimum ``f(x) = 0`` is attained at ``x_i = 2^{-\\frac{2^i - 2}{2^i}}``. The
recommended bounds are ``-5 \\leq x_i \\leq 5``.

# Examples
```jldoctest
julia> dixonprice([1.0; 2.0; 3.0; 4.0])
4230.0
```
"""
function dixonprice(x::Vector{Float64})
    x1 = x[begin]
    series = 0
    for i = 2:length(x)
        series += i * (2 * x[i]^2 - x[i - 1])^2
    end
    return (x1 - 1)^2 + series
end