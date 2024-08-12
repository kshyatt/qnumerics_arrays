### A Pluto.jl notebook ###
# v0.19.45

using Markdown
using InteractiveUtils

# ╔═╡ 3f871cef-b530-474e-bcec-5b0a4cd3e594
using LinearAlgebra

# ╔═╡ 7216dff6-493a-4d32-9761-0e6dd045dbd6
md"""
# QNumerics Arrays session

This notebook contains examples for the [QNumerics 2024](https://qnumerics.org/) session on arrays.
"""

# ╔═╡ f8420954-6ba4-45ad-8fc5-4fafd5bfdbef
md"""
## Array basics

In this section, we'll look at some basic operations on arrays, including extending and truncating them.
"""

# ╔═╡ 5a872eec-58af-11ef-3121-a1b16a22306a
a = [1, 2, 3, 4]

# ╔═╡ 67d5b51f-eec9-4803-a770-77cea7a32643
push!(a, 5)

# ╔═╡ 1ec81021-5112-4c92-8d22-a96f2074aa76
pushfirst!(a, 0)

# ╔═╡ 775d69b9-6676-4179-bcf0-8d4d306e1212
pop!(a)

# ╔═╡ 3edcbad6-5ec7-4440-9e37-027c5fc41ec0
a

# ╔═╡ a315dbba-fc6a-4166-96a6-a8bae5d419be
popfirst!(a)

# ╔═╡ 641dd8ab-3bab-4a9c-8b4b-17cedfcb54bc
a

# ╔═╡ 287e5139-12fd-4456-a712-eae8e8135f89
b = splice!(a, 2:3)

# ╔═╡ 664688cf-eeb0-4a01-98d9-d76bb27880e4
a

# ╔═╡ 383aa69d-ddda-4f10-99e3-5c84e7c39a7f
append!(a, [5, 6, 7]) # how does this differ from push!

# ╔═╡ f08bc31a-78c8-4138-8032-4f44e981d58c
md"""
What's the difference between `vcat`, `hcat`, and regular `cat`?
"""

# ╔═╡ b342e910-2d8e-4e26-9820-a5810a65a1d9
c = vcat(a, [8, 9, 10])

# ╔═╡ 9cb896f2-aa51-4592-9cd8-c729606be7c6
d = hcat(a, rand(1:5, length(a)))

# ╔═╡ 51cdecf5-3781-47b5-84a6-ece9d996114b
reverse!(a)

# ╔═╡ b764b094-d550-4c74-aa67-e85cd6ee08ff
ndims(d)

# ╔═╡ c2ea0d9c-6532-474b-a05c-42ca91ab411d
size(d)

# ╔═╡ 71bfee4b-a654-4f36-bfa7-a08ac1fa8d60
size(d, 2)

# ╔═╡ 19a2afb9-a3d9-41ce-8865-64fad12c139a
e = fill(2, (3, 4, 5))

# ╔═╡ 602ae7f4-3227-4f9d-a4a7-4427f7f05899
f = 1:3:20 # a range -- note the that the step size is the SECOND argument

# ╔═╡ c749d3f4-ed27-4235-8065-8ada48ed56d0
collect(f)

# ╔═╡ 412e0bca-9534-4761-a302-727a3075c3a8
md"""
## Indexing

Now let's look at the various ways we can index arrays. Note the special reserved Julia keyword `end`. Julia arrays support indexing with:
  - integers
  - ranges
  - vectors of integers, vectors of booleans
  - and more!
"""

# ╔═╡ 64e1519e-dab5-4133-930d-f802f2371eaa
g = collect(1:10)

# ╔═╡ 191b5627-84bc-4db8-a7eb-06f9fc10b283
g[1:2:3]

# ╔═╡ 87c169d0-93ac-4299-b7d7-bbe34a35af18
g[5:end]

# ╔═╡ 4f961b9f-705e-408a-a85c-58faf2b9cd62
md"""
Can you imagine a scenario in quantum information science where this kind of indexing might be useful?
"""

# ╔═╡ 208996a0-6494-4db0-ae9f-113fed237211
g[[false, true, false, true, true, false, false, false, false, true]]

# ╔═╡ d2761705-9fe7-4b45-acdb-f80541df3730
g[[1, 2, 7, 3]]

# ╔═╡ 25c989fb-39df-4690-8705-72d3b70f597e
g[5] # what happens if you use an Int8(5) as the index?

# ╔═╡ 0c3cfc5b-378f-4dce-b814-ccbfe4269607
h = rand(4, 4)

# ╔═╡ b5d282f6-f877-4aa4-92f9-83b22c620ed3
h[[1, 10, 5, 2]]

# ╔═╡ 3d7dfd95-60ff-4e1f-9c1d-7d3f6515adf7
h[1:3:end]

# ╔═╡ b5e1f72e-60e6-4bb0-b339-29eba2e7cff0
i = rand(2, 2, 2)

# ╔═╡ 4e857214-2245-4793-be7f-805fc701e79f
i[1:4:end]

# ╔═╡ 839beb2c-d9a4-472d-9165-d6b0808b4500
h[1, 1]

# ╔═╡ cb0c961e-e8c1-4746-bc7b-1fb66aa99496
h[2:3, 3:4]

# ╔═╡ d6965865-aa3d-4db0-8084-c2623b7037ca
i[2, 1, 2]

# ╔═╡ feea922d-efae-4ae7-a248-6f6c7beb3baf
i[1, :, 2]

# ╔═╡ 802742a9-8b25-43b8-88e5-beafe6ce3c20
# h[1, 2, 1, 1] # do you think this should work?

# ╔═╡ e1fd3147-f088-4c83-aaf5-bc422020e372
eachindex(i)

# ╔═╡ f4c263c3-c2e4-49fd-8e0d-af94f9c8aeab
collect(CartesianIndices(size(i)))

# ╔═╡ 6e68a9de-86f7-4db9-aa5d-86546bd91b80
md"""
## Higher dimensional arrays

Julia has good support for `N`-dimensional arrays when `N > 2`. This is useful for representing tensors or transforming a vector back and forth to a tensor representation (for `einsum`, for example.)
"""

# ╔═╡ 5f895444-0f88-44b1-9c7b-dd9838c7a010
j = rand(3, 4, 5)

# ╔═╡ 9152bd5b-ef6a-4c21-ac75-4f90d847a15b
permutedims(j, (3, 2, 1))

# ╔═╡ f425d06a-43e7-4d8b-ae6c-d96e15816230
strides(j)

# ╔═╡ 1b8325c0-41ec-4a4c-81f0-e290ecb9a797
mapslices(sum, j; dims=(1, 2))

# ╔═╡ 8f5081b5-388a-407d-89c4-e6f72d2079be
k = rand(ComplexF64, 5, 5)

# ╔═╡ 0840afbc-ae1b-41b8-9116-e54f180f1e39
transpose(k)

# ╔═╡ 8b0b7616-f152-42fe-947a-1f5d7e50ab21
adjoint(k)

# ╔═╡ 51f40e81-1aaa-42ba-8c26-6d6960b2a366
md"""
## Broadcasting 🔈

Broadcasting is used to do elementwise operations on Julia arrays, and can help us avoid allocations and write simple, extensible code without 5 nested `for` loops. Let's see it in action.
"""

# ╔═╡ 708895a3-c564-43b6-a8c3-2c14a5b6d4e9
l = rand(ComplexF64, 3, 3)

# ╔═╡ d635b8c2-96d9-46c5-8e09-ddcd9d35f0aa
abs2.(l)

# ╔═╡ e0cbe34f-3408-4a02-bcde-ac42126ec2da
m = rand(0:10, 3, 3)

# ╔═╡ 21cd108c-0913-477f-97ec-b5375c4d5adc
m .+ 2

# ╔═╡ 7c9d3217-fb07-4eb7-bd64-a134492bef71
n = rand(0:10, 10)

# ╔═╡ d1e7dfd1-372c-4784-9604-af6f66263658
n[1:2:end] .-= 3

# ╔═╡ ccc21abd-ed17-4d68-986a-9e8fce3ce3ef
md"""
Now we'll compare "naive" broadcasting with broadcast fusion using the `@.` operator, which allows us to force all operations on a line to be broadcasted simultaneously and avoids multiple loop executions.
"""

# ╔═╡ b5b43c47-333e-44aa-a152-613b10bf9e45
no_fusion(a) = abs2.(a) - 3a + sqrt.(a)

# ╔═╡ 78899795-8afc-497b-8367-dce29db97a41
fusion(a) = @. abs2(a) - 3a + sqrt(a)

# ╔═╡ 6e843dcc-e66a-4166-a9b4-5dd83faf9daa
md"""
We invoke each of our new functions once to have Julia and LLVM compile them for the provided types. Then we can do a fair comparison of their runtimes and allocations.
"""

# ╔═╡ 4c5450ab-b88f-42a8-9c86-2d9402114367
fusion([1.1, 2.2]); #compile

# ╔═╡ 2ba2f509-4be7-427f-9501-d18d1aa7b0d3
no_fusion([1.1, 2.2]); #compile

# ╔═╡ e71a45e2-8c59-4608-8360-98308c5df003
md"""
Let's use an input array large enough to see a real difference. We use the `@timev` macro to get more detailed information on what Julia was doing during the code execution -- this is a very useful tool for understanding why code is slow or fast!
"""

# ╔═╡ e6dd49e0-2d12-47c2-ae13-bd5791ee6a16
o = rand(Float64, 10^6);

# ╔═╡ bc25c132-147e-41fc-8347-57f1134a9692
@timev no_fusion(o);

# ╔═╡ bfb12e2f-0c1a-40f9-bec3-055426bc8d2b
@timev fusion(o);

# ╔═╡ 43c1d5fd-80b9-4eca-a2d8-02e0ad881694
md"""
## Views 👀

Julia's views provide a non-allocating window into an array. This lets us perform operations on array slices without thrashing the garbage collector (yay!). Again we'll write a function using views, and one that doesn't use views, and compare them. *Be careful* to use views only when you know you are not mutating the underlying array or if you intend to mutate it!
"""

# ╔═╡ e110966b-071d-48fa-a129-387746986729
p = rand(1:5, 10)

# ╔═╡ 4be865f7-357b-4b57-99c1-a660c93d8625
q = a[1:5]

# ╔═╡ 73a6a919-0697-4c97-a7e6-0390eed0fa7b
r = @view a[1:5]

# ╔═╡ 535bb175-6e27-4fea-8647-318d79d8c5fb
no_views_sum(x) = sum(x[3:end-2])

# ╔═╡ fe126b27-1e80-456a-b510-41ba00a1e10c
@views views_sum(x) = sum(x[3:end-2])

# ╔═╡ c1031b4c-9717-44db-99a4-92a8f507672b
views_sum(collect(1:5)); # compile

# ╔═╡ 3848708f-0250-4733-8267-23bdc77e3503
no_views_sum(collect(1:5)); # compile

# ╔═╡ 1b13cc9c-d6e0-4cc7-9ec4-96e1ed952382
s = rand(1:5, 10^6);

# ╔═╡ d4af657a-a989-4fe5-bf5b-781e53cc1b20
@timev no_views_sum(s);

# ╔═╡ febdbecc-1729-489f-9b7b-86c885d30df6
@timev views_sum(s);

# ╔═╡ 818c13f3-5673-4d09-a6ca-19fcb3e9672f
md"""
## The `LinearAlgebra` standard library

Julia also provides a very flexible set of linear algebra routines as part of its standard library. You can load these with `using LinearAlgebra` -- the stdlib comes installed with Julia itself. Under the hood, Julia is using high performance BLAS and LAPACK implementations with quite good generic fallbacks for non-BLAS types. If you have an Intel CPU, you can use Intel MKL if you wish (see the Julia documentation for how to do this). 
"""

# ╔═╡ 4a8e9831-78fd-434c-b1da-552aaf240c25
A = rand(ComplexF64, 4, 4)

# ╔═╡ a45801e1-bc7d-4eef-b1f3-2dd9e0bf340e
Ah = A + A' # A + adjoint(A)

# ╔═╡ 77446f10-2897-41df-88a7-1120096ea6ae
@which eigvals(Ah)

# ╔═╡ e15e3d58-7388-4d63-9851-2c26db609388
@which eigvals(Hermitian(Ah))

# ╔═╡ ff92f3eb-ac59-4cb4-b38e-8d3bd3387996
md"""
Let's verify that we get the same eigenvalues no matter which path we take.
"""

# ╔═╡ c63b8e75-bd0f-4526-b2af-7371047ec6a5
eigvals(Ah)

# ╔═╡ a038ae60-fdb9-4f7e-9ffc-d1a0b56d3650
eigvals(Hermitian(Ah))

# ╔═╡ e728ad2b-7588-4ca3-90c8-c0b4afe9ee98
B = rand(ComplexF64, 64, 64)

# ╔═╡ 7dc47fef-3434-4f5b-a678-def068f444ab
Bh = B + B'

# ╔═╡ a735fa06-35c2-4f4e-97e0-524dbb8454ea
@timev eigvals(Bh);

# ╔═╡ 01437c19-55d8-4de0-b07e-f8235b0e93a7
@timev eigvals(Hermitian(Bh));

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.4"
manifest_format = "2.0"
project_hash = "ac1187e548c6ab173ac57d4e72da1620216bce54"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.23+4"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+1"
"""

# ╔═╡ Cell order:
# ╟─7216dff6-493a-4d32-9761-0e6dd045dbd6
# ╟─f8420954-6ba4-45ad-8fc5-4fafd5bfdbef
# ╠═5a872eec-58af-11ef-3121-a1b16a22306a
# ╠═67d5b51f-eec9-4803-a770-77cea7a32643
# ╠═1ec81021-5112-4c92-8d22-a96f2074aa76
# ╠═775d69b9-6676-4179-bcf0-8d4d306e1212
# ╠═3edcbad6-5ec7-4440-9e37-027c5fc41ec0
# ╠═a315dbba-fc6a-4166-96a6-a8bae5d419be
# ╠═641dd8ab-3bab-4a9c-8b4b-17cedfcb54bc
# ╠═287e5139-12fd-4456-a712-eae8e8135f89
# ╠═664688cf-eeb0-4a01-98d9-d76bb27880e4
# ╠═383aa69d-ddda-4f10-99e3-5c84e7c39a7f
# ╟─f08bc31a-78c8-4138-8032-4f44e981d58c
# ╠═b342e910-2d8e-4e26-9820-a5810a65a1d9
# ╠═9cb896f2-aa51-4592-9cd8-c729606be7c6
# ╠═51cdecf5-3781-47b5-84a6-ece9d996114b
# ╠═b764b094-d550-4c74-aa67-e85cd6ee08ff
# ╠═c2ea0d9c-6532-474b-a05c-42ca91ab411d
# ╠═71bfee4b-a654-4f36-bfa7-a08ac1fa8d60
# ╠═19a2afb9-a3d9-41ce-8865-64fad12c139a
# ╠═602ae7f4-3227-4f9d-a4a7-4427f7f05899
# ╠═c749d3f4-ed27-4235-8065-8ada48ed56d0
# ╠═412e0bca-9534-4761-a302-727a3075c3a8
# ╠═64e1519e-dab5-4133-930d-f802f2371eaa
# ╠═191b5627-84bc-4db8-a7eb-06f9fc10b283
# ╠═87c169d0-93ac-4299-b7d7-bbe34a35af18
# ╟─4f961b9f-705e-408a-a85c-58faf2b9cd62
# ╠═208996a0-6494-4db0-ae9f-113fed237211
# ╠═d2761705-9fe7-4b45-acdb-f80541df3730
# ╠═25c989fb-39df-4690-8705-72d3b70f597e
# ╠═0c3cfc5b-378f-4dce-b814-ccbfe4269607
# ╠═b5d282f6-f877-4aa4-92f9-83b22c620ed3
# ╠═3d7dfd95-60ff-4e1f-9c1d-7d3f6515adf7
# ╠═b5e1f72e-60e6-4bb0-b339-29eba2e7cff0
# ╠═4e857214-2245-4793-be7f-805fc701e79f
# ╠═839beb2c-d9a4-472d-9165-d6b0808b4500
# ╠═cb0c961e-e8c1-4746-bc7b-1fb66aa99496
# ╠═d6965865-aa3d-4db0-8084-c2623b7037ca
# ╠═feea922d-efae-4ae7-a248-6f6c7beb3baf
# ╠═802742a9-8b25-43b8-88e5-beafe6ce3c20
# ╠═e1fd3147-f088-4c83-aaf5-bc422020e372
# ╠═f4c263c3-c2e4-49fd-8e0d-af94f9c8aeab
# ╟─6e68a9de-86f7-4db9-aa5d-86546bd91b80
# ╠═5f895444-0f88-44b1-9c7b-dd9838c7a010
# ╠═9152bd5b-ef6a-4c21-ac75-4f90d847a15b
# ╠═f425d06a-43e7-4d8b-ae6c-d96e15816230
# ╠═1b8325c0-41ec-4a4c-81f0-e290ecb9a797
# ╠═8f5081b5-388a-407d-89c4-e6f72d2079be
# ╠═0840afbc-ae1b-41b8-9116-e54f180f1e39
# ╠═8b0b7616-f152-42fe-947a-1f5d7e50ab21
# ╟─51f40e81-1aaa-42ba-8c26-6d6960b2a366
# ╠═708895a3-c564-43b6-a8c3-2c14a5b6d4e9
# ╠═d635b8c2-96d9-46c5-8e09-ddcd9d35f0aa
# ╠═e0cbe34f-3408-4a02-bcde-ac42126ec2da
# ╠═21cd108c-0913-477f-97ec-b5375c4d5adc
# ╠═7c9d3217-fb07-4eb7-bd64-a134492bef71
# ╠═d1e7dfd1-372c-4784-9604-af6f66263658
# ╟─ccc21abd-ed17-4d68-986a-9e8fce3ce3ef
# ╠═b5b43c47-333e-44aa-a152-613b10bf9e45
# ╠═78899795-8afc-497b-8367-dce29db97a41
# ╟─6e843dcc-e66a-4166-a9b4-5dd83faf9daa
# ╠═4c5450ab-b88f-42a8-9c86-2d9402114367
# ╠═2ba2f509-4be7-427f-9501-d18d1aa7b0d3
# ╟─e71a45e2-8c59-4608-8360-98308c5df003
# ╠═e6dd49e0-2d12-47c2-ae13-bd5791ee6a16
# ╠═bc25c132-147e-41fc-8347-57f1134a9692
# ╠═bfb12e2f-0c1a-40f9-bec3-055426bc8d2b
# ╟─43c1d5fd-80b9-4eca-a2d8-02e0ad881694
# ╠═e110966b-071d-48fa-a129-387746986729
# ╠═4be865f7-357b-4b57-99c1-a660c93d8625
# ╠═73a6a919-0697-4c97-a7e6-0390eed0fa7b
# ╠═535bb175-6e27-4fea-8647-318d79d8c5fb
# ╠═fe126b27-1e80-456a-b510-41ba00a1e10c
# ╠═c1031b4c-9717-44db-99a4-92a8f507672b
# ╠═3848708f-0250-4733-8267-23bdc77e3503
# ╠═1b13cc9c-d6e0-4cc7-9ec4-96e1ed952382
# ╠═d4af657a-a989-4fe5-bf5b-781e53cc1b20
# ╠═febdbecc-1729-489f-9b7b-86c885d30df6
# ╟─818c13f3-5673-4d09-a6ca-19fcb3e9672f
# ╠═3f871cef-b530-474e-bcec-5b0a4cd3e594
# ╠═4a8e9831-78fd-434c-b1da-552aaf240c25
# ╠═a45801e1-bc7d-4eef-b1f3-2dd9e0bf340e
# ╠═77446f10-2897-41df-88a7-1120096ea6ae
# ╠═e15e3d58-7388-4d63-9851-2c26db609388
# ╟─ff92f3eb-ac59-4cb4-b38e-8d3bd3387996
# ╠═c63b8e75-bd0f-4526-b2af-7371047ec6a5
# ╠═a038ae60-fdb9-4f7e-9ffc-d1a0b56d3650
# ╠═e728ad2b-7588-4ca3-90c8-c0b4afe9ee98
# ╠═7dc47fef-3434-4f5b-a678-def068f444ab
# ╠═a735fa06-35c2-4f4e-97e0-524dbb8454ea
# ╠═01437c19-55d8-4de0-b07e-f8235b0e93a7
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
