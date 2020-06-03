push!(LOAD_PATH,"../src/")

using Documenter, PSOJulia

makedocs(
    sitename="PSOJulia",
    format = Documenter.HTML(prettyurls = false),
    pages = [
        "index.md",
        "algorithm.md",
        "utilities.md",
        "functions.md"
    ]
)