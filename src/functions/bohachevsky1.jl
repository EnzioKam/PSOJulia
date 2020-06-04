"""
    bohachevsky1(x)

Evaluates the bohachevsky1 function on the vector x and returns the value.
```math
f(x) = \\sum_{i=1}^{d-1} x_i^2 + 2x_{i+1}^2 -0.3\\cos(3\\pi x_i)-0.4\\cos(4\\pi x_{i+1})+0.7)
```

The global minimum ``f(x) = 0`` is attained at ``x = (0, ... , 0)``. The
recommended bounds are ``-100 \\leq x_i \\leq 100``.

# Examples
```jldoctest
julia> bohachevsky1([1.5; 2.2; 3.6; 4.7])
102.78901699437496
```
"""
function bohachevsky1(x::Vector{Float64})
    x1 = x[begin:end-1]
    x2 = x[begin+1:end]
    total = x1.^2 + 2*(x2.^2) - 0.3*cos.(3*pi*x1) - 0.4*cos.(4*pi*x2) .+ 0.7
    return sum(total)
end