# Documentation

Building the documentation requires the use of `Documenter.jl`. 

To install, activate the environment by running the folowing:

```
julia
pkg> activate .
pkg> instantiate
exit()
```

Back in the terminal, run the following to build the documentation:

```
julia --project make.jl
```

Add the `--color=yes` to show colourised build output.