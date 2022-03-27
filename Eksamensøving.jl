
function Spill(I)
    n = length(I)
    r = zeros(n)
    r[n] = 1
    temp = Inf
    for i in 1:n-1
        temp = Inf
        for j in 1:I[n-i]
            if j > i
                temp = 1
            elseif 1 + r[n-i+j] < temp
                temp = 1 + r[n-i+j]
            end
        end
        r[n-i] = temp
    end
    return r
end

I = [3,5,5,3,1,4,1,2,5,3,5,2,1,1]
Spill(I)
