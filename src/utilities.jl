"""
    matrix_bound(lb::Float64, up::Float64, en::Int64, dim::Int64)

Generates two matrices A and B of dimension (dim, en), where the entries
of A contain lb and the entries of B contain up.

# Examples
```jldoctest
julia> A, B = matrix_bound(-5.12, 5.12, 2, 3);
julia> A
3×2 Array{Float64,2}:
 -5.12  -5.12
 -5.12  -5.12
 -5.12  -5.12
julia> B
3×2 Array{Float64,2}:
 5.12  5.12
 5.12  5.12
 5.12  5.12
```
"""
function matrix_bound(lb::Float64, up::Float64, en::Int64, dim::Int64)
    @assert size(up) == size(lb) "Unequal bound sizes"
    @assert lb < up "lb and up do not satisfy constraints"
    A = fill(lb, dim, en)
    B = fill(up, dim, en)
    return A, B
end

"""
    matrix_bound(lb::Vector{Float64}, up::Vector{Float64}, en::Int64, dim::Int64)

Generates two matrices A and B of dimension (n, en), where n = dim is the
length of lb and up. The columns of A are made up of copies of lb,
and the columns of B are made up of copies of up.

# Examples
```jldoctest
julia> lb = [1.5; 2.5];
julia> up = [3.1; 4.7];
julia> A, B = matrix_bound(lb, up, 3, 2);
julia> A
2×3 Array{Float64,2}:
 1.5  1.5  1.5
 2.5  2.5  2.5
julia> B
2×3 Array{Float64,2}:
 3.1  3.1  3.1
 4.7  4.7  4.7
```
"""
function matrix_bound(lb::Vector{Float64}, up::Vector{Float64}, en::Int64, dim::Int64)
    @assert size(up) == size(lb) "Unequal bound sizes"
    @assert all(lb .< up) "lb and up do not satisfy constraints"
    @assert length(up) == dim "lb, up do not match specified dimension"
    A = repeat(lb, 1, en)
    B = repeat(up, 1, en)
    return A, B
end

"""
    generate_random_matrix(A, B)

Generates a matrix X of the same size as the input arguments A and B, 
each element containing a uniform random variable where each entry 
``X_{i,j}`` contains ``U \\sim (A_{i,j}, B_{i,j})``. Used in [`sPSO`](@ref).

# Examples
```jldoctest
julia> A = [1 2; 3 4];
julia> B = [5 6; 7 8];
julia> generate_random_matrix(A, B)
2×2 Array{Float64,2}:
 4.1516   2.27863
 5.42611  6.95403

julia> C = [1 2 3; 4 5 6];
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