"""
    rosenbrock(x)

Evaluates the rosenbrock function on the vector x and returns the value.
```math
f(x) = \\sum_{i=1}^{d-1} \\left[ 100(x_{i+1} - x_i^2)^2 + (x_i - 1)^2 \\right]
```
The global minimum ``f(x) = 0`` is attained at ``x = (1, ... , 1)``. The
recommended bounds are ``-100 \\leq x_i \\leq 100``.

# Examples
```jldoctest
julia> rosenbrock([1.0; 2.0; 3.0; 4.0])
2705.0
```
"""
function rosenbrock(x::Vector{Float64})
    y = x[2:end]
    z = x[1:end - 1]
    return sum(100 * (y .- z.^2).^2 + (z .- 1).^2)
end