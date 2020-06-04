"""
    sphere(x)

Evaluates the sphere function on the vector x and returns the value.
```math
f(x) = \\sum_{i=1}^d x_i^2
```
The global minimum ``f(x) = 0`` is attained at ``x = (0, ... , 0)``. The
recommended bounds are ``-100 \\leq x_i \\leq 100``.

# Examples
```jldoctest
julia> sphere([1.0; 2.0; 3.0; 4.0])
30
```
"""
function sphere(x::Vector{Float64})
    return sum(x.^2)
end