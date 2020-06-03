"""
    sphere(x)

Evaluates the sphere function on the vector x and returns the value.
```math
f(x) = \\sum_{i=1}^d x_i^2
```
The global minimum ``f(x) = 0`` is attained at ``x = (0, ... , 0)``.

# Examples
```jldoctest
julia> sphere([1;2;3;4])
30
```
"""
function sphere(x::Vector{Float64})
    return sum(x.^2)
end