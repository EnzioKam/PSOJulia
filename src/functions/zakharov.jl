"""
    zakharov(x)

Evaluates the zakharov function on the vector x and returns the value.
```math
f(x) = \\sum_{i=1}^d x_i^2 - \\left( \\sum_{i=1}^d 0.5ix_i \\right)^2
+ \\left( \\sum_{i=1}^d 0.5ix_i \\right)^4
```
The global minimum ``f(x) = 0`` is attained at ``x_i = (0 , ... , 0)``. The
recommended bounds are ``-5 \\leq x_i \\leq 10``.

# Examples
```jldoctest
julia> zakharov([1.0; 2.0; 3.0; 4.0])
50880.0
```
"""
function zakharov(x::Vector{Float64})
    seq = collect(1:length(x))
    s1 = sum(x.^2)
    ix = sum(0.5 * seq .* x)
    return s1 + ix^2 + ix^4
end