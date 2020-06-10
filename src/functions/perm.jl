"""
    perm(x)

Evaluates the perm function on the vector x and returns the value.
```math
f(x) = \\sum_{i=1}^d \\left( \\sum_{i=1}^d \\left( j^i + \\beta \\right) 
\\left( \\frac{x_j}{j} \\right)^i - 1 \\right)^2
```
where ``\\beta = 0.5``.

The global minimum ``f(x) = 0`` is attained at ``x = (1, 2, ... , d-1 , d)``. The
recommended bounds are ``-d \\leq x_i \\leq d``.

# Examples
```jldoctest
julia> perm([1.0; 2.0; 3.0; 4.0])
0.0
```
"""
function perm(x::Vector{Float64})
    b = 0.5
    d = length(x)
    val = 0
    for i = 1:d
        temp = 0
        for j = 1:d
           temp += (j^i + b) * ((x[j] / j)^i - 1)^2; 
        end
        val = val + temp^2
    end
    return val
end