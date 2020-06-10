"""
    rastrigin(x)

Evaluates the rastrigin function on the vector x and returns the value.
```math
f(x) = 10d + \\sum_{i=1}^d \\left[ x_i^2 - 10\\cos(2\\pi x_i) \\right]
```
The global minimum ``f(x) = 0`` is attained at ``x = (0, ... , 0)``. The
recommended bounds are ``-5.12 \\leq x_i \\leq 5.12``.

# Examples
```jldoctest
julia> rastrigin([1.0; 2.0; 3.0; 4.0])
30.0
```
"""
function rastrigin(x::Vector{Float64})
    return 10 * length(x) + sum(x.^2 - 10 * cos.(2 * pi * x))
end