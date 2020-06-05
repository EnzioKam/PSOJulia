"""
    griewank(x)

Evaluates the griewank function on the vector x and returns the value.
```math
f(x) = \\sum_{i=1}^d \\frac{x_i^2}{4000} - \\prod_{i=1}^d \\cos \\left( 
    \\frac{x_i}{\\sqrt{i}} \\right) + 1
```
The global minimum ``f(x) = 0`` is attained at ``x = (0, ... , 0)``. The
recommended bounds are ``-600 \\leq x_i \\leq 600``.

# Examples
```jldoctest
julia> griewank([1.0; 2.0; 3.0; 4.0])
1.001870378003202
```
"""
function griewank(x::Vector{Float64})
    seq = collect(1:length(x))
    s = sum(x.^2) / 4e3
    p = prod(cos.(x./sqrt.(seq)))
    return 1 + s - p
end