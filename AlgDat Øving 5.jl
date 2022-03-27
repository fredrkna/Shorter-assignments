
function dnasimilarity(s1, s2)
    teller = 0
    for i in 1:Int64(length(s1))
        if s1[i] == s2[i]
            teller += 1
        end
    end
    return teller
end

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
    @test dnasimilarity("A", "A") == 1
    @test dnasimilarity("A", "T") == 0
    @test dnasimilarity("ATCG", "ATGC") == 2
    @test dnasimilarity("ATATATA", "TATATAT") == 0
    @test dnasimilarity("ATGCATGC", "ATGCATGC") == 8
    @test dnasimilarity("CAATAAGGATCTGGTAGCTT", "CCTTACTGAAGCCGCTATGC") == 6
end

function searchtree(root, dna)
    currentNode = root
    for i in 1:Int64(length(dna))
        if haskey(currentNode.children, dna[i])
            currentNode = currentNode.children[dna[i]]
        else
            return 0
        end
    end
    return currentNode.count
end

try
    mutable struct Node
        children::Dict{Char,Node}
        count::Int
    end
catch
    println("Node() allerede definert")
end

Node() = Node(Dict(), 0)

root1 = Node(Dict('A' => Node(Dict{Char,Node}(), 1),'G' => Node(Dict('A' => Node(Dict{Char,Node}(), 2)), 1)), 0)
println("Hei")
root2 = Node(Dict('A' => Node(Dict{Char,Node}(), 1),'G' => Node(Dict('A' => Node(Dict{Char,Node}(), 1),'G' => Node(Dict{Char,Node}(), 1)), 1),'T' => Node(Dict('G' => Node(Dict('T' => Node(Dict{Char,Node}(), 1)), 0),'T' => Node(Dict('G' => Node(Dict{Char,Node}(), 1)), 0)), 0),'C' => Node(Dict('C' => Node(Dict('A' => Node(Dict{Char,Node}(), 1)), 1)), 1)), 0)

s1 = "AG"
s2 = "GA"
s3 = "TGT"

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
    @test searchtree(root1, s1) == 0
    @test searchtree(root1, s2) == 2
    @test searchtree(root1, s3) == 0
    @test searchtree(root2, s1) == 0
    @test searchtree(root2, s2) == 1
    @test searchtree(root2, s3) == 1
end

function buildtree(dnasequences)
    root = Node()
    # Alle sekvenser har den tomme strengen som prefix:
    L = Int64(length(dnasequences))
    root.count = L
    # Din kode
    for i in 1:L
        currentNode = root
        for j in 1:Int64(length(dnasequences[i]))
            if !haskey(currentNode.children, dnasequences[i][j])
                currentNode.children[dnasequences[i][j]] = Node()
            end
            currentNode = currentNode.children[dnasequences[i][j]]
            currentNode.count += 1
        end
    end
    return root
end

import Base: ==
(==)(a::Node, b::Node) = a.count == b.count && a.children == b.children

dnasequences1 = ["A"]
dnasequences2 = ["A", "T", "C", "G"]
dnasequences3 = ["AG", "AGT", "AGTA", "AGTT", "AGTC"]
dnasequences4 = vcat(dnasequences1, dnasequences2, dnasequences3)

tree1 = Node(Dict('A' => Node(Dict{Char,Node}(), 1)), 1)
tree2 = Node(Dict('A' => Node(Dict{Char,Node}(), 1),'G' => Node(Dict{Char,Node}(), 1),'T' => Node(Dict{Char,Node}(), 1),'C' => Node(Dict{Char,Node}(), 1)), 4)
tree3 = Node(Dict('A' => Node(Dict('G' => Node(Dict('T' => Node(Dict('A' => Node(Dict{Char,Node}(), 1),'T' => Node(Dict{Char,Node}(), 1),'C' => Node(Dict{Char,Node}(), 1)), 4)), 5)), 5)), 5)
tree4 = Node(Dict('A' => Node(Dict('G' => Node(Dict('T' => Node(Dict('A' => Node(Dict{Char,Node}(), 1),'T' => Node(Dict{Char,Node}(), 1),'C' => Node(Dict{Char,Node}(), 1)), 4)), 5)), 7),'G' => Node(Dict{Char,Node}(), 1),'T' => Node(Dict{Char,Node}(), 1),'C' => Node(Dict{Char,Node}(), 1)), 10)

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
    @test buildtree(dnasequences1) == tree1
    @test buildtree(dnasequences2) == tree2
        @test buildtree(dnasequences3) == tree3
    @test buildtree(dnasequences4) == tree4
end


function brokendnasearch(root, dna, i=1)
    teller = 0
    if i == Int64(length(dna))+1
        return root.count
    else
        if dna[i] != '?'
            if haskey(root.children, dna[i])
                teller += brokendnasearch(root.children[dna[i]], dna, i+1)
            else
                return 0
            end
        else
            if haskey(root.children, 'A')
                teller += brokendnasearch(root, dna[1:i-1]*"A"*dna[i+1:end], i)
            end
            if haskey(root.children, 'C')
                teller += brokendnasearch(root, dna[1:i-1]*"C"*dna[i+1:end], i)
            end
            if haskey(root.children, 'G')
                teller += brokendnasearch(root, dna[1:i-1]*"G"*dna[i+1:end], i)
            end
            if haskey(root.children, 'T')
                teller += brokendnasearch(root, dna[1:i-1]*"T"*dna[i+1:end], i)
            end
        end
    end
    return teller
end

root1 = Node(Dict('A' => Node(Dict{Char,Node}(), 1)), 0)
root2 = Node(Dict('A' => Node(Dict('G' => Node(Dict('T' => Node(Dict('A' => Node(Dict{Char,Node}(), 1),'T' => Node(Dict{Char,Node}(), 1),'C' => Node(Dict{Char,Node}(), 1)), 4)), 5)), 5)), 0)
root3 = Node(Dict('C' => Node(Dict('C' => Node(Dict('C' => Node(Dict('C' => Node(Dict('C' => Node(Dict('C' => Node(Dict{Char,Node}(), 1)), 2)), 3)), 4)), 5)), 6)), 0)

s1 = "A"
s2 = "T"
s3 = "?"
s4 = "??"
s5 = "C?C"
s6 = "???"
s7 = "?????"

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
    @test brokendnasearch(root1, s1) == 1
    @test brokendnasearch(root1, s2) == 0
    @test brokendnasearch(root1, s3) == 1
    @test brokendnasearch(root1, s4) == 0
    @test brokendnasearch(root2, s1) == 5
    @test brokendnasearch(root2, s3) == 5
    @test brokendnasearch(root2, s4) == 5
    @test brokendnasearch(root2, s5) == 0
    @test brokendnasearch(root2, s6) == 4
    @test brokendnasearch(root3, s5) == 4
    @test brokendnasearch(root3, s6) == 4
    @test brokendnasearch(root3, s7) == 2
end

