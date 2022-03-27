
function lislength(s)
    mls = zeros(Int, size(s))
    mls[1] = 1
    L = length(s)
    for i = 2:length(s)
        mls[i] = 
    end
    return maximum(mls) # Returnerer det største tallet i listen
end

test = [5,3,3,6,7]
#Int(true)
a = lislength(test)
println(a)
#3>2

function cumulative(weights)
    rows, cols = size(weights)
    matrix = copy(weights)
    for i in 2:rows
        for j in 1:cols
            if j != 1 && j!= cols
                a = matrix[i-1,j-1]
                b = matrix[i-1,j]
                c = matrix[i-1,j+1]
                min = minimum([a,b,c])
                matrix[i,j] += min
            elseif j == 1
                b = matrix[i-1,j]
                c = matrix[i-1,j+1]
                min = minimum([b,c])
                matrix[i,j] += min
            else
                a = matrix[i-1,j-1]
                b = matrix[i-1,j]
                min = minimum([a,b])
                matrix[i,j] += min
            end
        end
    end
    return matrix
end

weights = [3  6  8 6 3;
          7  6  5 7 3;
          4  10 4 1 6;
          10 4  3 1 2;
          6  1  7 3 9]

a = cumulative(weights)

function backtrack(pathweights)
    rows, cols = size(pathweights)
    path = []
    push!(path, (rows, argmin(pathweights[rows,:])))
    for i in rows:-1:2
        tall = path[end][2]
        if tall != 1 && tall != cols
            push!(path, (i-1, argmin(pathweights[i-1,tall-1:tall+1])+tall-2))
        elseif tall == 1
            push!(path, (i-1, argmin(pathweights[i-1,1:2])))
        else
            push!(path, (i-1, argmin(pathweights[i-1,end-1:end])+cols-2))
        end
    end 
    return path
end

pathweights = cumulative(weights)
backtrack(pathweights)
#path = [(1,2), (3,4)]
#path[1][2]
#for i in 5:-1:1
#    println(i)
#end
