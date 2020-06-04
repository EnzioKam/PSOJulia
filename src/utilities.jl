"""
    generate_random_matrix(A, B)

Generates a matrix X of the same size as the input arguments A and B, 
each element containing a uniform random variable where each entry 
``X_{i,j}`` contains ``U \\sim (A_{i,j}, B_{i,j})``. Used in [`sPSO`](@ref).

# Examples
```jldoctest
A = [1 2; 3 4];
B = [5 6; 7 8];
julia> generate_random_matrix(A, B)
2×2 Array{Float64,2}:
 4.1516   2.27863
 5.42611  6.95403

C = [1 2 3; 4 5 6];
julia> generate_random_matrix(B, C)
ERROR: AssertionError: Unequal matrix sizes
```
"""
function generate_random_matrix(A, B)
    @assert size(A) == size(B) "Unequal matrix sizes"
    return rand(size(A)...) .* (B - A) + A
end

"""
    generate_particles(A, B)

Wrapper function that calls [`generate_random_matrix(A, B)`](@ref) to generate initial
particle positions.
"""
function generate_particles(A, B)
    return generate_random_matrix(A, B)
end

"""
    generate_velocities(A, B)

Wrapper function that calls [`generate_random_matrix(-(B-A), B-A)`](@ref) to generate initial
particle velocities.
"""
function generate_velocities(A, B)
    return generate_random_matrix(-(B-A), B-A)
end