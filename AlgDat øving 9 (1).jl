
mutable struct DisjointSetNode
    rank::Int
    p::DisjointSetNode
    DisjointSetNode() = (obj = new(0); obj.p = obj;)
end

function findset(x)
    if x != x.p
        x.p = findset(x.p)
    end
    return x.p
end

function union!(x, y)
    X = findset(x)
    Y = findset(y)
    if X.rank > Y.rank
        Y.p = X
    else
        X.p = Y
        if X.rank == Y.rank
            Y.rank += 1
        end
    end
end

function hammingdistance(s1, s2)
    teller = 0
    for i in 1:length(s1)
        if s1[i]!=s2[i]
            teller +=1
        end
    end
    return teller
end

s1 = "ATG"
s2 = "TAG"
hammingdistance(s1, s2)

function findclusters(E, n, k)
    nodes = []
    for i in 1:n
        push!(nodes, DisjointSetNode())
    end
    sort!(E)
    i = 1
    h = 0
    while h < n-k
        if findset(nodes[E[i][2]]) != findset(nodes[E[i][3]])
            union!(nodes[E[i][2]], nodes[E[i][3]])
            h+=1
        end
        i+=1
    end
    A = []
    set = DisjointSetNode[]
    i = 1
    while length(set) != k && i <= n
        if findset(nodes[i]) in set
        else
            push!(set, findset(nodes[i]))
            push!(A, [])
        end
        i+=1
    end
    for j in 1:n
        for l in 1:k
            if findset(nodes[j]) == set[l]
                push!(A[l], j)
            end
        end
    end
    return A
end

E = [(1,1,2), (2,3,4), (3,5,1), (4, 2, 4)]
A = [[1,2,3], [4,5],[7]]
A = findclusters(E, 5, 3)

function findanimalgroups(animals, k)
    E = []
    n = length(animals)
    for i in 1:n-1
        for j in i+1:n
            push!(E, (hammingdistance(animals[i][2], animals[j][2]), i, j))
        end
    end
    A = findclusters(E, n, k)
    B = []
    for i in 1:k
        push!(B, [])
        for j in 1:length(A[i])
            push!(B[i], animals[A[i][j]][1])
        end
    end
    return B
end

animals = [("Spurv", "CCATTCGT"), ("Mus", "TAGGCATA"), ("Elg", "CCGGATTA"), ("Hjort", "CCGGAATA"), ("Ugle", "GGATTCGG"), ("Hamster", "TAGGCAGG"), ("Marsvin", "TAGGCATG"), ("Hauk", "GGATGCGG")]
findanimalgroups(animals, 3)
