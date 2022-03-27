
function chartodigit(character)
    #Dette er en hjelpefunksjon for å få omgjort en char til tall
    #Den konverterer 'a' til 1, 'b' til 2 osv.
    #Eksempel: chartodigit("hei"[2]) gir 5 siden 'e' er den femte bokstaven i alfabetet.

    return character - '`'
end

function countingsortletters(A,position)
    C = zeros(Int64, 26)
    L = Int64(length(A))
    B = copy(A)
    for j in 1:L
        n = chartodigit(A[j][position])
        C[n] += 1
    end
    for j in 2:26
        C[j]+=C[j-1]
    end
    for j in L:-1:1
        n = chartodigit(A[j][position])
        B[C[n]] = A[j]
        C[n] -= 1
    end
    return B
end

A = ["hei", "pa", "deg", "din", "gamle", "sei" ]

println(chartodigit('a'))

D = "hei"
E = "fisk"
D = E
println(D)

B = countingsortletters(A,2)

println(B)

function countingsortlength(A)
    L0 = 0
    for i in A
        L1 = Int64(length(i))
        if L1 > L0
            L0 = L1
        end
    end
    C = zeros(Int64, L0+1)
    B = copy(A)
    for j in A
        n = Int64(length(j))
        C[n+1] += 1
    end
    for j in 2:L0+1
        C[j]+=C[j-1]
    end
    L = Int64(length(A))
    for j in L:-1:1
        L1 = Int64(length(A[j]))
        B[C[L1+1]] = A[j]
        C[L1+1] -= 1
    end
    return B
end

G = ["kobra", "aggie", "agg", "x", "kort", "", "hyblen"]
F = countingsortlength(G)
#println(G[1:3])
#C=[1, 4, 2, 5, 0, 7]
#for i in C
#    println(i)
#end

function flexradix(A, maxlength)
    B = countingsortlength(A)
    C = zeros(Int64, maxlength+1)
    L = Int64(length(A))
    for j in A
        n = Int64(length(j))
        C[n+1] += 1
    end
    for j in 2:maxlength+1
        C[j]+=C[j-1]
    end
    for i in maxlength:-1:1
        B[C[i]+1:L] = countingsortletters(B[C[i]+1:L],i)
    end
    return B
end

G = ["kobra", "aggie", "agg", "kort", "hyblen"]
H = flexradix(G, 6)
println(H)
