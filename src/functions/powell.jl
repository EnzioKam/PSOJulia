"""
    powell(x)

Evaluates the powell function on the vector x and returns the value.
```math
f(x) = \\sum_{i=1}^{d/4} \\left[ \\left( x_{4i-3} + 10x_{4i-2} \\right)^2 
+ 5 \\left( x_{4i-1} - x_{4i} \\right) + \\left( x_{4i-2} - 2x_{4i-1} \\right)^4 
+ 10 \\left( x_{4i-3} - x_{4i} \\right) \\right]
```

The global minimum ``f(x) = 0`` is attained at ``x = (0, ... , 0)``. The
recommended bounds are ``-100 \\leq x_i \\leq 100``.

# Examples
```jldoctest
julia> powell([1.0; 2.0; 3.0; 4.0])
1512.0
```
"""
function powell(x::Vector{Float64})
    n = div(length(x), 4)
    val = 0
    for i = 1:n
        t1 = (x[4 * i - 3] + 10 * x[4 * i - 2])^2
        t2 = 5 * (x[4 * i - 1] - x[4 * i])^2
        t3 = (x[4 * i - 2] - 2 * x[4 * i - 1])^4
        t4 = 10 * (x[4 * i - 3] - x[4 * i])^4
        val += t1 + t2 + t3 + t4
    end
    return val
end