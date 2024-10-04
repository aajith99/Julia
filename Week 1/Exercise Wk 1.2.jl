function count_frequencies(arr::Array{Int})
    freq_dict = Dict{Int, Int}()            #Create an empty dictionary
    
    for num in arr
        if num in keys(freq_dict)           #Retrieves an iterable collection of all the keys in the dictionary-Checks if num is among these keys.
            freq_dict[num] += 1             #If num is already a key in freq_dict, increment its associated value by 1.
        else
            freq_dict[num] = 1              #If num is not a key in freq_dict, add it as a new key with a value of 1.
        end
    end
    
    return freq_dict
end

arr = [1, 2, 2, 3, 1, 4, 3, 2]
result = count_frequencies(arr)
println(result)




