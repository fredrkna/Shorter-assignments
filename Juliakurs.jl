
f(x,y)=x*y

a = f(5,6)

println(a)

c = div(45, 7)
println(c)

d = 2^3
println(d)

e = 'f'

g = "ord"

#str --> string(), len --> length()

h = "128"
i = parse(Int, h) #evt Float64
println(i)

j = "a, b = $a, $c"
println(j)

raw"hejksldkfh\ahsasd" #raw hindrer \ i å gi newline

k = "foo" * "bar"
println(k)

l = "foo"^5
println(l)

m = Int32[1,2,3,4]

n = [
    1 2 3;
    4 5 6;
    7 8 9
]

display(n)

o = Array{Int, 1}(undef, 100) # np.zeros(100), kan bruke Vector istedenfor Array
o = zeros(Int, 100) #np.zeros(100)

p = [1,2,3,4]
push!(p, 3) #pushfirst!(l, 0)
println(p)

q = p
append!(q, [6,7,8,9])

r = rand(Int64)

s = Dict([
    "foo" => 3,
    "bar" => 7
])


s = Dict{String, Rational{Int}}()
push!(s, "foo" => 1//2)
#hashkey for å finne ut om noe finnes i dictionary

t1 = Set([1,2,4,8,16])
t2 = Set([2,3,5,16])

t3 = union(t1, t2)
println(t3)

for i in length(l) : -1 : 1
end

function main()
    #definer globale variabler her
end

struct TestType
    x
    y
    z
end

u = TestType(1,2,3) #immutable
println(u.y)

mutable struct TestType2
    x::Float64
    y::Float64
    z::Float64
end

u2 = TestType2(2.1, 3.14, 2.18)
u2.z = 4.16
println(u2)

struct TestType3{T}
    x::T
    y::T
    z::T
end

#overloading:
#function Base.show(io::IO, p::Polar)
#    show(io, p.r)
#    write(io, "fghjk")
#end
    
#Base.sort()

#io = open("test.txt", "w")
#write(io, "Hello World!")
#close(io)
