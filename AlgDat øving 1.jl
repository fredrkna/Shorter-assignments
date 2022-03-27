
function insertionsort!(A)
    for j in 2:length(A)
        key = A[j]
        i = j-1
        while i > 0 && A[i] > key
            A[i+1]=A[i]
            i = i-1
        end
        A[i+1] = key
    end
end

A = [3,5,2,4,7,8,6]

insertionsort!(A)

println(A)


