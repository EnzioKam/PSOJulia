"""
    branin(x)

Evaluates the beale function on the vector x of length 2 and returns the value.
```math
f(x) = a(x_2 - bx_1^2 + cx_1 - r)^2 + s(1 - t)\\cos(x_1) + s
```
where ``a = 1, b = \\frac{5.1}{4\\pi^2}, c = \\frac{5}{\\pi}, r = 6, s = 10, t = \\frac{1}{8\\pi}``.

The global minimum ``f(x) = 0.397887`` is attained at ``x = (9.42478, 2.475), 
(-\\pi, 12.275), (\\pi, 2.275) ``. The recommended bounds are ``-10 \\leq x_i \\leq 10``.

# Examples
```jldoctest
julia> branin([1.0; 2.0])
21.62763539206238
```
"""
function branin(x::Vector{Float64})
    @assert length(x) == 2 "branin can only take in Vector{Float64} of length 2."
    x1, x2 = x
    a = 1
    b = 5.1 / (4 * pi^2)
    c = 5/pi
    r = 6
    s = 10
    t = 1 / (8 * pi)
    t1 = a * (x2 - b * x1^2 + c * x1 - r)^2;
    t2 = s * (1 - t) * cos(x1);
    return t1 + t2 + s;
end