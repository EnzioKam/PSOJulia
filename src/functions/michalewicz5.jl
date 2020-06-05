"""
    michalewicz5(x)

Evaluates the michalewicz5 function on the vector x of length 5 and returns the value.
```math
f(x) = - \\sum_{i=1}^5 \\sin(x_i) \\sin^{2m} \\left( \\frac{i x_i^2}{\\pi} \\right)
```

The global minimum ``f(x) = -4.687658`` is attained at multiple global minima. The
recommended bounds are ``0 \\leq x_i \\leq \\pi``.

# Examples
```jldoctest
julia> michalewicz5([1.0; 2.0; 3.0; 4.0; 5.0])
0.7958946159933006
```
"""
function michalewicz5(x::Vector{Float64})
    @assert length(x) == 5 "michalewicz5 can only take in Vector{Float64} of length 5."
    m = 10
    i = collect(1:length(x))
    val = - sum(sin.(x) .* (sin.(i .* x.^2 / pi).^(2 * m)))
end