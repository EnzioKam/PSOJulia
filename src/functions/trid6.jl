"""
    trid6(x)

Evaluates the trid6 function on the vector x and returns the value.
```math
f(x) = \\sum_{i=1}^d (x_i - 1)^2 - \\sum_{i=2}^d x_i x_{i-1}
```
The global minimum ``f(x) = -d(d+4)(d-1)/6`` is attained at ``x_i = i(d + 1 - i)``. The
recommended bounds are ``-d^2 \\leq x_i \\leq d^2``.

# Examples
```jldoctest
julia> trid6([1.0; 2.0; 3.0; 4.0])
-6.0
```
"""
function trid6(x::Vector{Float64})
    return sum((x .- 1).^2) - sum(x[2:end].*x[1:end - 1]);
end