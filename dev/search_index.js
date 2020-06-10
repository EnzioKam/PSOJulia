var documenterSearchIndex = {"docs":
[{"location":"functions.html#Functions-1","page":"Functions","title":"Functions","text":"","category":"section"},{"location":"functions.html#Defining-new-functions-1","page":"Functions","title":"Defining new functions","text":"","category":"section"},{"location":"functions.html#","page":"Functions","title":"Functions","text":"To use objective functions other than the ones provided in this package, ensure that the new function takes in an argument of type Vector{Float64}, i.e. Array{Float64, 1}. The function should also return a single value of type Float64.","category":"page"},{"location":"functions.html#","page":"Functions","title":"Functions","text":"For example, if you were to add in a new function called objective, the function can be written as follows:","category":"page"},{"location":"functions.html#","page":"Functions","title":"Functions","text":"function objective(x::Vector{Float64})\n    return sum(x.^2)\nend","category":"page"},{"location":"functions.html#","page":"Functions","title":"Functions","text":"Note that the new function should work on all sizes of Vector other than empty vectors unless otherwise stated. In this case, you should add in an assertion to ensure that the input will conform to the required size.","category":"page"},{"location":"functions.html#List-of-available-functions-1","page":"Functions","title":"List of available functions","text":"","category":"section"},{"location":"functions.html#","page":"Functions","title":"Functions","text":"The function definitions and other information are taken with reference from Ab Wahab et. al[1] and Surjanovic and Bingham[2]. A total of 30 functions from the package are listed below.","category":"page"},{"location":"functions.html#","page":"Functions","title":"Functions","text":"[1]: Ab Wahab MN, Nefti-Meziani S, Atyabi A (2015) A Comprehensive Review of Swarm Optimization Algorithms. PLoS ONE 10(5): e0122827. https://doi.org/10.1371/journal.pone.0122827","category":"page"},{"location":"functions.html#","page":"Functions","title":"Functions","text":"[2]: Surjanovic, S. & Bingham, D. (2013). Virtual Library of Simulation Experiments: Test Functions and Datasets. Retrieved June 4, 2020, from http://www.sfu.ca/~ssurjano.","category":"page"},{"location":"functions.html#","page":"Functions","title":"Functions","text":"Pages = [\"functions.md\"]","category":"page"},{"location":"functions.html#","page":"Functions","title":"Functions","text":"Modules = [PSOJulia]\nPages = [\"ackley.jl\", \"beale.jl\", \"bohachevsky1.jl\", \"bohachevsky2.jl\", \"bohachevsky3.jl\",\n    \"booth.jl\", \"branin.jl\", \"bukin6.jl\", \"colville.jl\", \"dixonprice.jl\", \"dropwave.jl\",\n    \"easom.jl\", \"eggholder.jl\", \"goldsteinprice.jl\", \"griewank.jl\", \"matyas.jl\", \"mccormick.jl\",\n    \"michalewicz5.jl\", \"perm.jl\", \"powell.jl\", \"rastrigin.jl\", \"rosenbrock.jl\", \"schaffer2.jl\",\n    \"schaffer4.jl\", \"schwefel.jl\", \"shubert.jl\", \"sphere.jl\", \"sumsquare.jl\", \"trid6.jl\", \"zakharov.jl\"]","category":"page"},{"location":"functions.html#PSOJulia.ackley-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.ackley","text":"ackley(x)\n\nEvaluates the ackley function on the vector x and returns the value.\n\nf(x) = -a exp left(-b sqrtfrac1d sum_i=1^d x_i^2 right)\n- exp left(frac1d cos(cx_i) + a + exp(1) right)\n\nwhere a = 0 b = 02 c = 2pi.\n\nThe global minimum f(x) = 0 is attained at x = (0   0). The recommended bounds are -32 leq x_i leq 32.\n\nExamples\n\njulia> ackley([1.0; 2.0; 3.0; 4.0])\n8.434694444437465\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.beale-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.beale","text":"beale(x)\n\nEvaluates the beale function on the vector x of length 2 and returns the value.\n\nf(x) = (15 - x_1 + x_1 x_2)^2 + (225 - x_1 + x_1 x_2^2)^2 + (2625 - x_1 + x_1 x_2^2)^2\n\nThe global minimum f(x) = 0 is attained at x = (3 05). The recommended bounds are -45 leq x_i leq 45.\n\nExamples\n\njulia> beale([1.0; 2.0])\n126.935\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.bohachevsky1-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.bohachevsky1","text":"bohachevsky1(x)\n\nEvaluates the bohachevsky1 function on the vector x and returns the value.\n\nf(x) = sum_i=1^d-1 x_i^2 + 2x_i+1^2 -03cos(3pi x_i)-04cos(4pi x_i+1)+07)\n\nThe global minimum f(x) = 0 is attained at x = (0   0). The recommended bounds are -100 leq x_i leq 100.\n\nExamples\n\njulia> bohachevsky1([1.5; 2.2; 3.6; 4.7])\n102.78901699437496\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.bohachevsky2-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.bohachevsky2","text":"bohachevsky2(x)\n\nEvaluates the bohachevsky1 function on the vector x and returns the value.\n\nf(x) = sum_i=1^d-1 x_i^2 + 2x_i+1^2 -03cos(3pi x_i) cos(4pi x_i+1)+03)\n\nThe global minimum f(x) = 0 is attained at x = (0   0). The recommended bounds are -100 leq x_i leq 100.\n\nExamples\n\njulia> bohachevsky2([1.5; 2.2; 3.6; 4.7])\n100.56229490168752\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.bohachevsky3-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.bohachevsky3","text":"bohachevsky3(x)\n\nEvaluates the bohachevsky1 function on the vector x and returns the value.\n\nf(x) = sum_i=1^d-1 x_i^2 + 2x_i+1^2 -03cos(3pi x_i + 4pi x_i+1)+03)\n\nThe global minimum f(x) = 0 is attained at x = (0   0). The recommended bounds are -100 leq x_i leq 100.\n\nExamples\n\njulia> bohachevsky3([1.5; 2.2; 3.6; 4.7])\n101.11363047737527\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.booth-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.booth","text":"booth(x)\n\nEvaluates the beale function on the vector x of length 2 and returns the value.\n\nf(x) = (x_1 + 2x_2 - 7)^2 + (2x_1 + x_2 - 5)^2\n\nThe global minimum f(x) = 0 is attained at x = (1 3). The recommended bounds are -10 leq x_i leq 10.\n\nExamples\n\njulia> booth([1.0; 2.0])\n5.0\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.branin-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.branin","text":"branin(x)\n\nEvaluates the beale function on the vector x of length 2 and returns the value.\n\nf(x) = a(x_2 - bx_1^2 + cx_1 - r)^2 + s(1 - t)cos(x_1) + s\n\nwhere a = 1 b = frac514pi^2 c = frac5pi r = 6 s = 10 t = frac18pi.\n\nThe global minimum f(x) = 0397887 is attained at x = (942478 2475)  (-pi 12275) (pi 2275). The recommended bounds are -10 leq x_i leq 10.\n\nExamples\n\njulia> branin([1.0; 2.0])\n21.62763539206238\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.bukin6-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.bukin6","text":"bukin6(x)\n\nEvaluates the beale function on the vector x of length 2 and returns the value.\n\nf(x) = 100 sqrtlvert x_2 - 001x_1^2 rvert + 001 lvert x_1 + 10 rvert\n\nThe global minimum f(x) = 0 is attained at x = (-10 1). The recommended bounds are -15 leq x_1 leq -5 -3 leq x_2 leq 3.\n\nExamples\n\njulia> bukin6([1.0; 2.0])\n141.17735979665886\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.colville-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.colville","text":"colville(x)\n\nEvaluates the colville function on the vector x of length 4 and returns the value.\n\nf(x) = 100(x_1^2 - x_2)^2 + (x_1 - 1)^2 + (x_3 - 1)^2 + 90(x_3^2 - x_4)^2 + \n101((x_2 - 1)^2 + (x_4 - 1)^2) + 198(x_2 - 1)(x_4 - 1)\n\nThe global minimum f(x) = 0 is attained at x = (1 1 1 1). The recommended bounds are -10 leq x_i leq 10.\n\nExamples\n\njulia> colville([1.0; 2.0; 3.0; 4.0])\n2514.4\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.dixonprice-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.dixonprice","text":"dixonprice(x)\n\nEvaluates the dixonprice function on the vector x and returns the value.\n\nf(x) = (x_1 - 1)^2 + sum_i=1^n i(2x_i^2 - x_i-1)^2\n\nThe global minimum f(x) = 0 is attained at x_i = 2^-frac2^i - 22^i. The recommended bounds are -5 leq x_i leq 5.\n\nExamples\n\njulia> dixonprice([1.0; 2.0; 3.0; 4.0])\n4230.0\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.dropwave-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.dropwave","text":"dropwave(x)\n\nEvaluates the beale function on the vector x of length 2 and returns the value.\n\nf(x) = - frac1 + cosleft( 12 sqrtx_1^2 + x_2^2 right)05(x_1^2 + x_2^2) + 2\n\nThe global minimum f(x) = -1 is attained at x = (0 0). The recommended bounds are -512 leq x_i leq 512.\n\nExamples\n\njulia> dropwave([1.0; 2.0])\n-0.19357369461450374\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.easom-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.easom","text":"easom(x)\n\nEvaluates the easom function on the vector x of length 2 and returns the value.\n\nf(x) = -cos(x_1) cos(x_2) exp left( -(x_1 - pi)^2 - (x_2 - pi)^2 right)\n\nThe global minimum f(x) = -1 is attained at x = (pi pi). The recommended bounds are -30 leq x_i leq 30.\n\nExamples\n\njulia> easom([1.0; 2.0])\n0.0006223571340136757\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.eggholder-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.eggholder","text":"eggholder(x)\n\nEvaluates the eggholder function on the vector x of length 2 and returns the value.\n\nf(x) = -(x_2 + 47) sin left( sqrtleftlvert x_2 + fracx_12 + 47 rightrvert right)\n- x_1 sin left( sqrtleftlvert x_1 - (x_2 + 47) rightrvert right)\n\nThe global minimum f(x) = -9596407 is attained at x = (512 4042319). The recommended bounds are -512 leq x_i leq 512.\n\nExamples\n\njulia> eggholder([1.0; 2.0])\n-34.08883356384574\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.goldsteinprice-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.goldsteinprice","text":"goldsteinprice(x)\n\nEvaluates the goldsteinprice function on the vector x of length 2 and returns the value.\n\nf(x) = left1 + (x_1 + x_2 + 1)^2(19 - 14x_1 + 3x_1^2- 14x_2 + 6x_1x_2 + 3x_2^2)right times \nleft30 + (2x_1 - 3x_2)^2(18 - 32x_1 + 12x_1^2 + 4x_2 - 36x_1x_2 + 27x_2^2)right\n\nThe global minimum f(x) = 3 is attained at x = (0 -1). The recommended bounds are -10 leq x_i leq 10.\n\nExamples\n\njulia> goldsteinprice([1.0; 2.0])\n137150.0\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.griewank-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.griewank","text":"griewank(x)\n\nEvaluates the griewank function on the vector x and returns the value.\n\nf(x) = sum_i=1^d fracx_i^24000 - prod_i=1^d cos left( \n    fracx_isqrti right) + 1\n\nThe global minimum f(x) = 0 is attained at x = (0   0). The recommended bounds are -600 leq x_i leq 600.\n\nExamples\n\njulia> griewank([1.0; 2.0; 3.0; 4.0])\n1.001870378003202\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.matyas-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.matyas","text":"matyas(x)\n\nEvaluates the matyas function on the vector x of length 2 and returns the value.\n\nf(x) = 026(x_1^2 + x_2^2) - 048 x_1 x_2\n\nThe global minimum f(x) = 0 is attained at x = (0 0). The recommended bounds are -10 leq x_i leq 10.\n\nExamples\n\njulia> matyas([1.0; 2.0])\n0.3400000000000001\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.mccormick-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.mccormick","text":"mccormick(x)\n\nEvaluates the mccormick function on the vector x of length 2 and returns the value.\n\nf(x) = sin(x_1 + x_2) + (x_1 - x_2)^2 - 15x_1 + 25x_2 + 1\n\nThe global minimum f(x) = -19133 is attained at x = (-054719 -154719). The recommended bounds are -15 leq x_1 leq 4 -3 leq x_2 leq 4.\n\nExamples\n\njulia> mccormick([1.0; 2.0])\n5.641120008059867\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.michalewicz5-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.michalewicz5","text":"michalewicz5(x)\n\nEvaluates the michalewicz5 function on the vector x of length 5 and returns the value.\n\nf(x) = - sum_i=1^5 sin(x_i) sin^2m left( fraci x_i^2pi right)\n\nThe global minimum f(x) = -4687658 is attained at multiple global minima. The recommended bounds are 0 leq x_i leq pi.\n\nExamples\n\njulia> michalewicz5([1.0; 2.0; 3.0; 4.0; 5.0])\n0.7958946159933006\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.perm-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.perm","text":"perm(x)\n\nEvaluates the perm function on the vector x and returns the value.\n\nf(x) = sum_i=1^d left( sum_i=1^d left( j^i + beta right) \nleft( fracx_jj right)^i - 1 right)^2\n\nwhere beta = 05.\n\nThe global minimum f(x) = 0 is attained at x = (1 2   d-1  d). The recommended bounds are -d leq x_i leq d.\n\nExamples\n\njulia> perm([1.0; 2.0; 3.0; 4.0])\n0.0\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.powell-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.powell","text":"powell(x)\n\nEvaluates the powell function on the vector x and returns the value.\n\nf(x) = sum_i=1^d4 left left( x_4i-3 + 10x_4i-2 right)^2 \n+ 5 left( x_4i-1 - x_4i right) + left( x_4i-2 - 2x_4i-1 right)^4 \n+ 10 left( x_4i-3 - x_4i right) right\n\nThe global minimum f(x) = 0 is attained at x = (0   0). The recommended bounds are -100 leq x_i leq 100.\n\nExamples\n\njulia> powell([1.0; 2.0; 3.0; 4.0])\n1512.0\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.rastrigin-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.rastrigin","text":"rastrigin(x)\n\nEvaluates the rastrigin function on the vector x and returns the value.\n\nf(x) = 10d + sum_i=1^d left x_i^2 - 10cos(2pi x_i) right\n\nThe global minimum f(x) = 0 is attained at x = (0   0). The recommended bounds are -512 leq x_i leq 512.\n\nExamples\n\njulia> rastrigin([1.0; 2.0; 3.0; 4.0])\n30.0\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.rosenbrock-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.rosenbrock","text":"rosenbrock(x)\n\nEvaluates the rosenbrock function on the vector x and returns the value.\n\nf(x) = sum_i=1^d-1 left 100(x_i+1 - x_i^2)^2 + (x_i - 1)^2 right\n\nThe global minimum f(x) = 0 is attained at x = (1   1). The recommended bounds are -100 leq x_i leq 100.\n\nExamples\n\njulia> rosenbrock([1.0; 2.0; 3.0; 4.0])\n2705.0\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.schaffer2-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.schaffer2","text":"schaffer2(x)\n\nEvaluates the schaffer2 function on the vector x of length 2 and returns the value.\n\nf(x) = 05 + fracsin^2(x_1^2 - x_2^2) - 05(1 + 00001(x_1^2 + x_2^2))^2\n\nThe global minimum f(x) = 0 is attained at x = (0 0). The recommended bounds are -100 leq x_i leq 100.\n\nExamples\n\njulia> schaffer2([1.0; 2.0])\n0.020394581994177263\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.schaffer4-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.schaffer4","text":"schaffer4(x)\n\nEvaluates the schaffer4 function on the vector x of length 2 and returns the value.\n\nf(x) = 05 + fraccos^2(sin(lvert x_1^2 - x_2^2 rvert)) - 05(1 + 00001(x_1^2 + x_2^2))^2\n\nThe global minimum f(x) = 0292579 is attained at x = (0, 1.25313) or (0, -1.25313). The recommended bounds are -100 leq x_i leq 100.\n\nExamples\n\njulia> schaffer4([1.0; 2.0])\n0.9895693939735433\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.schwefel-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.schwefel","text":"schwefel(x)\n\nEvaluates the schwefel function on the vector x and returns the value.\n\nf(x) = 4189829d - sum_i=1^d x_i sin(sqrt(lvert x_i rvert))\n\nThe global minimum f(x) = -4189829d is attained at x = (4209687   4209687). The recommended bounds are -500 leq x_i leq 500.\n\nExamples\n\njulia> schwefel([1.0; 2.0; 3.0; 4.0])\n-9.415272519067155\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.shubert-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.shubert","text":"shubert(x)\n\nEvaluates the shubert function on the vector x of length 2 and returns the value.\n\nf(x) = prod_j=1^2 sum_i=1^5 i cos((i + 1)x_j + i)\n\nThe global minimum f(x) = -1867309 is attained at multiple global minima. The recommended bounds are -10 leq x_i leq 10.\n\nExamples\n\njulia> shubert([1.0; 2.0])\n1.4675729549059044\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.sphere-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.sphere","text":"sphere(x)\n\nEvaluates the sphere function on the vector x and returns the value.\n\nf(x) = sum_i=1^d x_i^2\n\nThe global minimum f(x) = 0 is attained at x = (0   0). The recommended bounds are -100 leq x_i leq 100.\n\nExamples\n\njulia> sphere([1.0; 2.0; 3.0; 4.0])\n30.0\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.sumsquare-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.sumsquare","text":"sumsquare(x)\n\nEvaluates the sumsquare function on the vector x and returns the value.\n\nf(x) = sum_i=1^d ix_i^2\n\nThe global minimum f(x) = 0 is attained at x = (0   0). The recommended bounds are -512 leq x_i leq 512.\n\nExamples\n\njulia> sumsquare([1.0; 2.0; 3.0; 4.0])\n100.0\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.trid6-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.trid6","text":"trid6(x)\n\nEvaluates the trid6 function on the vector x and returns the value.\n\nf(x) = sum_i=1^d (x_i - 1)^2 - sum_i=2^d x_i x_i-1\n\nThe global minimum f(x) = -d(d+4)(d-1)6 is attained at x_i = i(d + 1 - i). The recommended bounds are -d^2 leq x_i leq d^2.\n\nExamples\n\njulia> trid6([1.0; 2.0; 3.0; 4.0])\n-6.0\n\n\n\n\n\n","category":"method"},{"location":"functions.html#PSOJulia.zakharov-Tuple{Array{Float64,1}}","page":"Functions","title":"PSOJulia.zakharov","text":"zakharov(x)\n\nEvaluates the zakharov function on the vector x and returns the value.\n\nf(x) = sum_i=1^d x_i^2 - left( sum_i=1^d 05ix_i right)^2\n+ left( sum_i=1^d 05ix_i right)^4\n\nThe global minimum f(x) = 0 is attained at x_i = (0    0). The recommended bounds are -5 leq x_i leq 10.\n\nExamples\n\njulia> zakharov([1.0; 2.0; 3.0; 4.0])\n50880.0\n\n\n\n\n\n","category":"method"},{"location":"algorithm.html#Algorithm-1","page":"Algorithm","title":"Algorithm","text":"","category":"section"},{"location":"algorithm.html#","page":"Algorithm","title":"Algorithm","text":"Pages = [\"algorithm.md\"]","category":"page"},{"location":"algorithm.html#","page":"Algorithm","title":"Algorithm","text":"Modules = [PSOJulia]\nPages = [\"algorithm.jl\"]","category":"page"},{"location":"algorithm.html#PSOJulia.PSO-Tuple{Array{Float64,2},Array{Float64,2},Float64,Float64,Float64,Any,Any,Any,Array{Int64,1},Any,Any}","page":"Algorithm","title":"PSOJulia.PSO","text":"PSO(X_initial, V_initial, w, c1, c2, u1, u2, fobj, allN, up, lb)\n\nWrapper function that calls sPSO with eta=1 and sig=0. See sPSO.\n\n\n\n\n\n","category":"method"},{"location":"algorithm.html#PSOJulia.sPSO-Tuple{Array{Float64,2},Array{Float64,2},Float64,Float64,Float64,Any,Any,Float64,Float64,Any,Array{Int64,1},Any,Any}","page":"Algorithm","title":"PSOJulia.sPSO","text":"sPSO(X_initial, V_initial, w, c1, c2, u1, u2, eta, sig, fobj, allN, up, lb)\n\nRuns the smoothed Particle Swarm Optimisation algorithm on the list of inputs. The function returns a vector of recorded global best value estimates, and a matrix of their corresponding positions.\n\nArguments\n\nX_initial: matrix of initial starting particle positions\nV_initial: matrix of initial starting particle velocities\nw: the intertia weight parameter\nc1: the cognitive acceleration coefficient\nc2: the social acceleration coefficient\nu1: function for random variable generation for cognitive term\nu2: function for random variable generation for social term\neta: step size parameter\nsig: standard deviation parameter\nfobj: objective function to be optimised\nallN: list of iteration numbers to record results at\nup: scalar / vector of upper bounds for each dimension\nlb: scalar / vector of lower bounds for each dimension\n\nExamples\n\njulia> allN = [10, 50, 100, 200, 400, Int(1e3), Int(3e3), Int(1e4)];\njulia> w = 1 - 0.729;\njulia> c1 = 1.5;\njulia> c2 = 1.5;\njulia> en = 32;\njulia> u1 = rand;\njulia> u2 = rand;\njulia> eta = 0.1;\njulia> sig = 0.5;\njulia> fobj = sphere;\njulia> dim = 5;\njulia> lb, up = -100.0, 100.0;\njulia> A, B = matrix_bounds(lb, up, en, dim);\njulia> v, p = sPSO(generate_particles(lb, up, en, dim), generate_velocities(lb, up, en, dim), \n                    w, c1, c2, u1, u2, eta, sig, fobj, allN, up, lb);\n\n\n\n\n\n","category":"method"},{"location":"utilities.html#Utilities-1","page":"Utilities","title":"Utilities","text":"","category":"section"},{"location":"utilities.html#","page":"Utilities","title":"Utilities","text":"Pages = [\"utilities.md\"]\nOrder   = [:function, :type]","category":"page"},{"location":"utilities.html#","page":"Utilities","title":"Utilities","text":"Modules = [PSOJulia]\nPages = [\"utilities.jl\"]\nOrder   = [:function, :type]","category":"page"},{"location":"utilities.html#PSOJulia.generate_particles-Tuple{Array{Float64,2},Array{Float64,2}}","page":"Utilities","title":"PSOJulia.generate_particles","text":"generate_particles(A::Matrix{Float64}, B::Matrix{Float64})\n\nWrapper function that calls generate_random_matrix(A, B) to generate initial particle positions.\n\n\n\n\n\n","category":"method"},{"location":"utilities.html#PSOJulia.generate_particles-Tuple{Float64,Float64,Int64,Int64}","page":"Utilities","title":"PSOJulia.generate_particles","text":"generate_particles(A::Float64, B::Float64, en::Int64, dim::Int64)\n\nWrapper function that calls generate_random_matrix(A, B, en, dim) to generate initial particle positions.\n\n\n\n\n\n","category":"method"},{"location":"utilities.html#PSOJulia.generate_random_matrix-Tuple{Array{Float64,2},Array{Float64,2}}","page":"Utilities","title":"PSOJulia.generate_random_matrix","text":"generate_random_matrix(A::Matrix{Float64}, B::Matrix{Float64})\n\nGenerates a matrix X of the same size as the input arguments A and B,  each element containing a uniform random variable where each entry  X_ij contains U sim (A_ij B_ij).\n\nExamples\n\njulia> A = [1 2; 3 4];\njulia> B = [5 6; 7 8];\njulia> generate_random_matrix(A, B)\n2×2 Array{Float64,2}:\n 4.1516   2.27863\n 5.42611  6.95403\n\njulia> C = [1 2 3; 4 5 6];\njulia> generate_random_matrix(B, C)\nERROR: AssertionError: Unequal matrix sizes\n\n\n\n\n\n","category":"method"},{"location":"utilities.html#PSOJulia.generate_random_matrix-Tuple{Float64,Float64,Int64,Int64}","page":"Utilities","title":"PSOJulia.generate_random_matrix","text":"generate_random_matrix(A::Float64, B::Float64, en::Int64, dim::Int64)\n\nGenerates a matrix X of size (dim, en) each element containing a uniform  random variable where each entry X_ij contains U sim (A B).\n\nExamples\n\njulia> generate_random_matrix(-10.0, 10.0, 3, 2)\n2×3 Array{Float64,2}:\n 7.42334   0.601355  -0.882865\n 6.26274  -4.92114    8.9034\n\n\n\n\n\n","category":"method"},{"location":"utilities.html#PSOJulia.generate_velocities-Tuple{Array{Float64,2},Array{Float64,2}}","page":"Utilities","title":"PSOJulia.generate_velocities","text":"generate_velocities(A::Matrix{Float64}, B::Matrix{Float64})\n\nWrapper function that calls generate_random_matrix(-(B-A), B-A) to generate initial particle velocities.\n\n\n\n\n\n","category":"method"},{"location":"utilities.html#PSOJulia.generate_velocities-Tuple{Float64,Float64,Int64,Int64}","page":"Utilities","title":"PSOJulia.generate_velocities","text":"generate_velocities(A::Float64, B::Float64, en::Int64, dim::Int64)\n\nWrapper function that calls generate_random_matrix(-(B-A), B-A, en, dim) to generate initial particle velocities.\n\n\n\n\n\n","category":"method"},{"location":"utilities.html#PSOJulia.matrix_bound-Tuple{Array{Float64,1},Array{Float64,1},Int64,Int64}","page":"Utilities","title":"PSOJulia.matrix_bound","text":"matrix_bound(lb::Vector{Float64}, up::Vector{Float64}, en::Int64, dim::Int64)\n\nGenerates two matrices A and B of dimension (n, en), where n = dim is the length of lb and up. The columns of A are made up of copies of lb, and the columns of B are made up of copies of up.\n\nExamples\n\njulia> lb = [1.5; 2.5];\njulia> up = [3.1; 4.7];\njulia> A, B = matrix_bound(lb, up, 3, 2);\njulia> A\n2×3 Array{Float64,2}:\n 1.5  1.5  1.5\n 2.5  2.5  2.5\njulia> B\n2×3 Array{Float64,2}:\n 3.1  3.1  3.1\n 4.7  4.7  4.7\n\n\n\n\n\n","category":"method"},{"location":"utilities.html#PSOJulia.matrix_bound-Tuple{Float64,Float64,Int64,Int64}","page":"Utilities","title":"PSOJulia.matrix_bound","text":"matrix_bound(lb::Float64, up::Float64, en::Int64, dim::Int64)\n\nGenerates two matrices A and B of dimension (dim, en), where the entries of A contain lb and the entries of B contain up.\n\nExamples\n\njulia> A, B = matrix_bound(-5.12, 5.12, 2, 3);\njulia> A\n3×2 Array{Float64,2}:\n -5.12  -5.12\n -5.12  -5.12\n -5.12  -5.12\njulia> B\n3×2 Array{Float64,2}:\n 5.12  5.12\n 5.12  5.12\n 5.12  5.12\n\n\n\n\n\n","category":"method"},{"location":"index.html#Home-1","page":"Home","title":"Home","text":"","category":"section"},{"location":"index.html#","page":"Home","title":"Home","text":"Documention for the PSOJulia module.","category":"page"},{"location":"index.html#","page":"Home","title":"Home","text":"The package contains the code to run PSO, sPSO, and provides a sample list of functions that can be used as objective functions.","category":"page"},{"location":"index.html#","page":"Home","title":"Home","text":"Pages = [\"algorithm.md\", \"utilities.md\", \"functions.md\"]","category":"page"}]
}
