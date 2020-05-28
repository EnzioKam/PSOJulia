function generate_random_matrix(A, B)
    @assert size(A) == size(B) "Unequal matrix sizes"
    return rand(size(A)...) .* (B - A) + A
end