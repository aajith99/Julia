macro make_square(var)
    return quote
        @eval function square($var)
            return $var * $var
        end
    end
end

@make_square x  # Creates a function square

println(square(5))