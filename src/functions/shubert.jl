"""
    shubert(x)

Evaluates the shubert function on the vector x of length 2 and returns the value.
```math
f(x) = \\prod_{j=1}^2 \\sum_{i=1}^5 i \\cos((i + 1)x_j + i)
```

The global minimum ``f(x) = -186.7309`` is attained at multiple global minima. The
recommended bounds are ``-10 \\leq x_i \\leq 10``.

# Examples
```jldoctest
julia> shubert([1.0; 2.0])
1.4675729549059044
```
"""
function shubert(x::Vector{Float64})
    @assert length(x) == 2 "shubert can only take in Vector{Float64} of length 2."
    x1, x2 = x
    seq = 1:5
    s1 = sum(seq .* cos.((seq .+ 1)*x1 + seq))
    s2 = sum(seq .* cos.((seq .+ 1)*x2 + seq))
    return s1 * s2
end