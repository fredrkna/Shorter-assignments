
mutable struct Node
    next::Union{Node, Nothing} # next kan peke på et Node-objekt eller ha verdien nothing.
    value::Int
end

function createlinkedlist(length)
    # Creates the list starting from the last element
    # This is done so the last element we generate is the head
    child = nothing
    node = nothing

    for i in 1:length
        node = Node(child, rand(1:800))
        child = node
    end
    return node
end

Lista = createlinkedlist(10)
println(Lista)

# Skriv koden din her!
function findindexinlist(linkedlist, index)
    Node = linkedlist
    i = 1
    
    while Node != nothing && i != index
        Node = Node.next
        i += 1
    end
    if Node == nothing
        return -1
    else
        return Node.value
    end
end

tall = findindexinlist(Lista, 4)
print(tall)

# Visste du at funksjoner kan ha emoji i navnet?  💯
function reverseandlimit(array, maxnumber)
    newArray = []
    for i in 1:length(array)
        index = length(array)+1-i
        value = array[index]
        if value > maxnumber
            push!(newArray, maxnumber)
        else
            push!(newArray, value)
        end
    end
    return newArray
end

List = [1,5,3,6,8,94,3,2,76]
tsiL = reverseandlimit(List, 7)
println(tsiL)

mutable struct NodeDoublyLinked
    prev::Union{NodeDoublyLinked, Nothing} # Er enten forrige node eller nothing
    next::Union{NodeDoublyLinked, Nothing} # Er enten neste node eller nothing
    value::Int # Verdien til noden
end

function createLinkedListDoublyLinked(length)
    # Create the list from the last element in the chain
    # This is so the returned element will be the first in the chain
    current = nothing
    beforeCurrent = nothing

    for i in 1:length
        # only fill out the next field because prev will be filled out later
        current = NodeDoublyLinked(nothing, beforeCurrent, rand(-100:100))
        # link up the node before this node to this node
        if beforeCurrent != nothing
            beforeCurrent.prev = current
        end
        beforeCurrent = current
    end
    return current
end

Listo = createLinkedListDoublyLinked(10)
println(Listo)

# Jeg tror jeg får kjeft om jeg hadde bruket flere emojies
# PS ikke lim in NodeDoublyLinked her
function maxofdoublelinkedlist(linkedlist)
    Node = linkedlist
    max = Node.value
    while Node.prev != nothing
        Node = Node.prev
        if Node.value > max
            max = Node.value
        end
    end
    while Node.next != nothing
        Node = Node.next
        if Node.value > max
            max = Node.value
        end
    end
    return max
end

Maxi=maxofdoublelinkedlist(Listo)
println(Maxi)
