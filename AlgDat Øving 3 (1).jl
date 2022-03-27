
F = [3.0 5.0; 1.0 2.0; 1.0 5.0; 1.0 7.0; 1.0 1.0; 8.0 3.0; 8.0 7.0; 8.0 2.0; 8.0 6.0]

#x og y er to sorterte arrays, coordinate angir koordinat akse
function mergearrays(x,y,coordinate)
    n1 = Int64(length(x)/2)
    n2 = Int64(length(y)/2)
    z = zeros(Float64, n1+n2, 2)
    i=1
    j=1
    while i != n1+1 && j != n2+1
        if x[i,coordinate] <= y[j, coordinate]
            z[i+j-1,:] = x[i,:]
            i += 1
        else
            z[i+j-1,:] = y[j,:]
            j += 1
        end
    end
    if i == n1+1
        for k = j:n2
            z[n1+k,:] = y[k,:]
        end
    else
        for k = i:n1
            z[n2+k,:] = x[k,:]
        end
    end
    return z
end

#x usortert array, coordinate angir koordinat akse vi skal sortere langs
function mergesort(x, coordinate)
    L = Int64(length(x)/2)
    if L > 1
        q = div(L+1, 2)
        a = mergesort(x[1:q,:], coordinate)
        b = mergesort(x[q+1:L,:], coordinate)
        return mergearrays(a, b, coordinate)
    else
        return x
    end
end

G = mergesort(F, 1)
I = mergesort(F, 2)

function binaryintervalsearch(x,delta, coordinate)
    L = Int64(length(x)/2)
    if L >=1
        if L%2==1
            q1 = div(L+1,2)
            q2 = q1
            Median = x[q1,coordinate]
        else
            q1 = div(L,2)
            q2 = q1+1
            Median = Float64(0.5*(x[q1,coordinate]+x[q2,coordinate]))
        end
        function binarysearchP(y, v, p, r)
            if p<r
                t = div(p+r,2)
                if y[t,coordinate] < v
                    binarysearchP(y, v, t+1, r) #[t+1:r,:]
                else
                    binarysearchP(y, v, p, t) #[p:t,:]
                end
            else
                return p
            end
        end
        function binarysearchR(y, v, p, r)
            if p<r
                t = div(p+r+1,2)
                if y[t,coordinate] > v
                    binarysearchR(y, v, p, t-1)  #[p:t-1,:]
                else
                    binarysearchR(y, v, t, r) #[t:r,:]
                end
            else
                return p
            end
        end
        a = binarysearchP(x[1:q1,:], Median-delta, 1, q1)
        if a == q1 && Median-delta > x[a,coordinate]
            a = -1
        end
        b = q2 -1 + binarysearchR(x[q2:L,:], Median + delta, 1, L-q2+1)
        if b == q2 && Median + delta < x[b, coordinate]
            b = -1
        end
#        if a == -1 || b==-1
#            a = -1
#            b = -1
#        end
        return a, b
    else
        return -1, -1
    end
end

binaryintervalsearch(I, 1, 2)

function bruteforce(x)
    L = Int64(length(x)/2)
    if L < 2
        return -1
    end
    function distance(x1, x2)
        return ((x1[1]-x2[1])^2 + (x1[2]-x2[2])^2)^0.5
    end
    d = distance(x[1,:], x[2,:])
    for i = 1:L-1
        for j = i+1:L
            temp = distance(x[i,:], x[j,:])
            if temp < d
                d = temp
            end
        end
    end
    return d
end

bruteforce(G)

x1 = [1.0 2.0; 2.0 3.0; 3.0 2.0; 3.0 4.0; 3.0 3.0; 4.0 5.0; 6.0 6.0; 7.0 1.0]
y1 = [7.0 1.0; 1.0 2.0; 3.0 2.0; 3.0 3.0; 2.0 3.0; 3.0 4.0; 4.0 5.0; 6.0 6.0]

function splitintwo(x,y)
    L = Int64(length(x)/2)
    if L == 1
        return x, y, x, y
    end
    q = div(L+1, 2)
    Median = x[q,1]
    x_left = x[1:q,:]
    x_right = x[q+1:L,:]
    Median = x[q,1]
    y_left = zeros(Float64, q, 2)
    y_right = zeros(Float64, L-q, 2)
    k = 1
    l = 1
    for i = 1:L
        if y[i,1] > Median
            y_right[l:l,:] = y[i:i,:]
            l+=1
        elseif y[i,1] < Median
            y_left[k:k,:]=y[i:i,:]
            k+=1
        else
            z1 = x_left[q,1]
            z2 = x_left[q,2]
            h = 1
            while z1 == Median && z2 != y[i,2] && h < q
                z1 = x_left[q-h,1]
                z2 = x_left[q-h,2]
                h+=1
            end
            if z2 == y[i,2] && z1 == Median
                y_left[k:k,:] = y[i:i,:]
                k+=1
            else
                y_right[l:l,:] = y[i:i,:]
                l+=1
            end
        end
    end
    return x_left, x_right, y_left, y_right
end

splitintwo(x1, y1)

function closestpair(x,y)
    L = Int64(length(x)/2)
    if L <= 3
        return bruteforce(x)
    else
        x_left, x_right, y_left, y_right = splitintwo(x,y)
        d_left = closestpair(x_left,y_left)
        d_right = closestpair(x_right, y_right)
    end
    if d_left < d_right
        delta1 = d_left
    else
        delta1 = d_right
    end
    a1, b1 = binaryintervalsearch(x, delta1, 1)
    a2, b2 = binaryintervalsearch(y, delta1, 2)
    function distance(x1, x2)
        return ((x1[1]-x2[1])^2 + (x1[2]-x2[2])^2)^0.5
    end
    if a1 != -1 && b1 != -1 && a1 != b1
        delta_x = bruteforce(x[a1:b1,:])
#        delta_x = distance(x[a1,:], x[a1+1,:])
#        for i = a1:b1
#            for j = i+1:b1
#                if x[j,1]-x[i,1] < delta1
#                    D = distance(x[j,:], x[i,:])
#                    if D < delta_x
#                        delta_x = D
#                    end
#                else
#                    break
#                end
#            end
#        end
    else
        delta_x = delta1
    end
    if a2 != -1 && b2 != -1 && a2!=b2
        delta_y = bruteforce(y[a2:b2,:])
#        delta_y = distance(y[a2,:], y[a2+1,:])
#        for i = a2:b2
#            for j = i+1:b2
#                if y[j,1]-y[i,1] < delta1
#                    D = distance(y[j,:], y[i,:])
#                    if D < delta_y
#                        delta_y = D
#                    end
#                else
#                    break
#                end
#            end
#        end
    else
        delta_y = delta1
    end
    if delta_x < delta_y
        delta2 = delta_x
    else
        delta2 = delta_y
    end
    if delta1 < delta2
        return delta1
    else
        return delta2
    end     
end

#Sørger for at closespair mottar sorterte arrays
#La stå, denne kalles for å teste koden
function callclosestpair(arr)
    x = mergesort(arr,1)
    y = mergesort(arr,2)
    return closestpair(x,y)
end

callclosestpair(F)

G = 10*rand(100000,2)
Gun = callclosestpair(G)
#Hild = bruteforce(G)
#println(Gun == Hild)
#println(Gun)
