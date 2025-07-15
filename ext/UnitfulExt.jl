module UnitfulExt
import Noise

using Unitful, ImageCore
using Unitful: Gain, uconvertp

"""
   add_gauss(X, SNR; clip=false)

Returns the array `X` with gauss noise with the signal-to-noise ratio `SNR`

`SNR` must explicitly be a `Unitful.Gain`
<<<<<<< HEAD

```jldoctest; setup=:(using Random; Random.seed!(42)) filter=r"(\d*)\.(\d{4})\d+" => s"\1.\2***"
julai> using Unitful

julia> A = rand(2)
2-element Vector{Float64}:
 0.5191067011114466
 0.4704326079396267

julia> add_gauss(A, 4u"dB")
2-element Vector{Float64}:
 0.41836422848196064
 0.4589556483843231
```
"""
Noise.add_gauss!(X::AbstractArray{<:Union{Gray,Real}}, SNR::T; clip=false) where {T<:Gain} = Noise.add_gauss!(X, sum(gray.(X) .^ 2) / (length(X) * uconvertp(Unitful.NoUnits, SNR)), clip=clip)
Noise.add_gauss(X::AbstractArray{<:Union{Gray,Real}}, SNR::T; clip=false) where {T<:Gain} = Noise.add_gauss!(copy(X), SNR; clip=clip)
||||||| parent of 1b98d89 (feat(extension): add Unitful extension to for adding gaussian noise with)
=======
```julia
using Unitful
add_gauss(X, 50u"dB")

```
"""
Noise.add_gauss!(X::AbstractArray{<:Gray}, SNR::T; clip=false) where {T<:Gain} = Noise.add_gauss!(X, sum(gray.(X) .^ 2) / (length(X) * uconvertp(Unitful.NoUnits, SNR)), clip=clip)
Noise.add_gauss(X::AbstractArray{<:Gray}, SNR::T; clip=false) where {T<:Gain} = Noise.add_gauss!(copy(X), SNR; clip=clip)
>>>>>>> 1b98d89 (feat(extension): add Unitful extension to for adding gaussian noise with)

end
