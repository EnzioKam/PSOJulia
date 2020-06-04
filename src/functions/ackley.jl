"""
    ackley(x)

Evaluates the ackley function on the vector x and returns the value.
```math
f(x) = -a \\exp \\left(-b \\sqrt{\\frac{1}{d} \\sum_{i=1}^d x_i^2} \\right)
- \\exp \\left(\\frac{1}{d} cos(cx_i) + a + \\exp(1) \\right)
```
where ``a = 0, b = 0.2, c = 2\\pi``.

The global minimum ``f(x) = 0`` is attained at ``x = (0, ... , 0)``. The
recommended bounds are ``-32 \\leq x_i \\leq 32``.

# Examples
```jldoctest
julia> ackley([1.0; 2.0; 3.0; 4.0])
8.434694444437465
```
"""
function ackley(x::Vector{Float64})
    d = length(x);
    t1 = -20 * exp(-0.2 * sqrt(sum(x.^2) / d))
    t2 = -1 * exp(sum(cos.(2 * pi * x)) / d)
    return t1 + t2 + 20 + exp(1)
end