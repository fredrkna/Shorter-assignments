
function usegreed(coins)
    L = length(coins)
    if L < 2
        return true
    end
    for i in 2:length(coins)
        if coins[i-1]%coins[i] != 0
            return false
        end
    end
    return true
end

printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test usegreed([20, 10, 5, 1]) == true
  @test usegreed([20, 15, 10, 5, 1]) == false
  @test usegreed([100, 1]) == true
  @test usegreed([5, 4, 3, 2, 1]) == false
  @test usegreed([1]) == true

end


function mincoinsgreedy(coins, value)
    mynter = 0
    for i in 1:length(coins)
        divi = div(value, coins[i])
        mynter += divi
        value -= divi*coins[i]
        if value == 0
            break
        end
    end
    return mynter
end

printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test mincoinsgreedy([1000,500,100,20,5,1],1226) == 6
  @test mincoinsgreedy([20,10,5,1],99) == 10
  @test mincoinsgreedy([5,1],133) == 29
end

function mincoins(coins, value)
    # Om du ikke trenger inf kan du fjerne den
    inf = typemax(Int)
    if usegreed(coins)
        return mincoinsgreedy(coins, value)
    else
        return 3
end


