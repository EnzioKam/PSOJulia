"""
    schwefel(x)

Evaluates the schwefel function on the vector x and returns the value.
```math
f(x) = 418.9829d - \\sum_{i=1}^d x_i \\sin(\\sqrt(\\lvert x_i \\rvert))
```

The global minimum ``f(x) = -418.9829d`` is attained at ``x = (420.9687, ... , 420.9687)``.
The recommended bounds are ``-500 \\leq x_i \\leq 500``.

# Examples
```jldoctest
julia> schwefel([1.0; 2.0; 3.0; 4.0])
-9.415272519067155
```
"""
function schwefel(x::Vector{Float64})
    return -sum(x.*sin.(sqrt.(abs.(x))))
end