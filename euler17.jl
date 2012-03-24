# This one gives a wrong answer, 100 greater than what is supposed to
# be. As I coudn't find the error, I solved it by hand. If you can
# find the error, tell me!

function con(num::Int)
    str = ""
    if num == 1000
        return "onethousand"
    end
    x::Int = div(num,100)
    if x == 1
        str = strcpy("onehundred")
    end
    if x == 2
        str = strcpy("twohundred")
    end
    if x == 3
        str = strcpy("threehundred")
    end
    if x == 4
        str = strcpy("fourhundred")
    end
    if x == 5
        str = strcpy("fivehundred")
    end
    if x == 6
        str = strcpy("sixhundred")
    end
    if x == 7
        str = strcpy("sevenhundred")
    end
    if x == 8
        str = strcpy("eighthhundred")
    end
    if x == 9
        str = strcpy("ninehundred")
    end
    y::Int = num % 100
    if x != 0 && y > 0
        str = strcat(str, "and")
    end
    if y > 0
        z::Int = y/10
        if y == 1
            str = strcat(str, "one")
        end
        if y == 2
            str = strcat(str, "two")
        end
        if y == 3
            str = strcat(str, "three")
        end
        if y == 4
            str = strcat(str, "four")
        end
        if y == 5
            str = strcat(str, "five")
        end
        if y == 6
            str = strcat(str, "six")
        end
        if y == 7
            str = strcat(str, "seven")
        end
        if y == 8
            str = strcat(str, "eight")
        end
        if y == 9
            str = strcat(str, "nine")
        end
        if y == 10
            str = strcat(str, "ten")
        end
        if y == 11
            str = strcat(str, "eleven")
        end
        if y == 12
            str = strcat(str, "twelve")
        end
        if y == 13
            str = strcat(str, "thirteen")
        end
        if y == 14
            str = strcat(str, "fourteen")
        end
        if y == 15
            str = strcat(str, "fifteen")
        end
        if y == 16
            str = strcat(str, "sixteen")
        end
        if y == 17
            str = strcat(str, "seventeen")
        end
        if y == 18
            str = strcat(str, "eighteen")
        end
        if y == 19
            str = strcat(str, "nineteen")
        end
        if 20 <= y <= 29
            str = strcat(str, "twenty")
            l = y % 10
            if l == 1
                str = strcat(str, "one")
            end
            if l == 2
                str = strcat(str, "two")
            end
            if l == 3
                str = strcat(str, "three")
            end
            if l == 4
                str = strcat(str, "four")
            end
            if l == 5
                str = strcat(str, "five")
            end
            if l == 6
                str = strcat(str, "six")
            end
            if l == 7
                str = strcat(str, "seven")
            end
            if l == 8
                str = strcat(str, "eight")
            end
            if l == 9
                str = strcat(str, "nine")
            end
            return str
        end
        if 30 <= y <= 39
            str = strcat(str, "thirty")
            l = y%10
            if l == 1
                str = strcat(str, "one")
            end
            if l == 2
                str = strcat(str, "two")
            end
            if l == 3
                str = strcat(str, "three")
            end
            if l == 4
                str = strcat(str, "four")
            end
            if l == 5
                str = strcat(str, "five")
            end
            if l == 6
                str = strcat(str, "six")
            end
            if l == 7
                str = strcat(str, "seven")
            end
            if l == 8
                str = strcat(str, "eight")
            end
            if l == 9
                str = strcat(str, "nine")
            end
            return str
        end
        if 40 <= y <= 49
            str = strcat(str, "forty")
            l = y%10
            if l == 1
                str = strcat(str, "one")
            end
            if l == 2
                str = strcat(str, "two")
            end
            if l == 3
                str = strcat(str, "three")
            end
            if l == 4
                str = strcat(str, "four")
            end
            if l == 5
                str = strcat(str, "five")
            end
            if l == 6
                str = strcat(str, "six")
            end
            if l == 7
                str = strcat(str, "seven")
            end
            if l == 8
                str = strcat(str, "eight")
            end
            if l == 9
                str = strcat(str, "nine")
            end
            return str
        end
        if 50 <= y <= 59
            str = strcat(str, "fifty")
            l = y%10
            if l == 1
                str = strcat(str, "one")
            end
            if l == 2
                str = strcat(str, "two")
            end
            if l == 3
                str = strcat(str, "three")
            end
            if l == 4
                str = strcat(str, "four")
            end
            if l == 5
                str = strcat(str, "five")
            end
            if l == 6
                str = strcat(str, "six")
            end
            if l == 7
                str = strcat(str, "seven")
            end
            if l == 8
                str = strcat(str, "eight")
            end
            if l == 9
                str = strcat(str, "nine")
            end
            return str
        end
        if 60 <= y <= 69
            str = strcat(str, "sixty")
            l = y%10
            if l == 1
                str = strcat(str, "one")
            end
            if l == 2
                str = strcat(str, "two")
            end
            if l == 3
                str = strcat(str, "three")
            end
            if l == 4
                str = strcat(str, "four")
            end
            if l == 5
                str = strcat(str, "five")
            end
            if l == 6
                str = strcat(str, "six")
            end
            if l == 7
                str = strcat(str, "seven")
            end
            if l == 8
                str = strcat(str, "eight")
            end
            if l == 9
                str = strcat(str, "nine")
            end
            return str
        end
        if 70 <= y <= 79
            str = strcat(str, "seventy")
            l = y%10
            if l == 1
                str = strcat(str, "one")
            end
            if l == 2
                str = strcat(str, "two")
            end
            if l == 3
                str = strcat(str, "three")
            end
            if l == 4
                str = strcat(str, "four")
            end
            if l == 5
                str = strcat(str, "five")
            end
            if l == 6
                str = strcat(str, "six")
            end
            if l == 7
                str = strcat(str, "seven")
            end
            if l == 8
                str = strcat(str, "eight")
            end
            if l == 9
                str = strcat(str, "nine")
            end
            return str
        end
        if 80 <= y <= 89
            str = strcat(str, "eighty")
            l = y%10
            if l == 1
                str = strcat(str, "one")
            end
            if l == 2
                str = strcat(str, "two")
            end
            if l == 3
                str = strcat(str, "three")
            end
            if l == 4
                str = strcat(str, "four")
            end
            if l == 5
                str = strcat(str, "five")
            end
            if l == 6
                str = strcat(str, "six")
            end
            if l == 7
                str = strcat(str, "seven")
            end
            if l == 8
                str = strcat(str, "eight")
            end
            if l == 9
                str = strcat(str, "nine")
            end
            return str
        end
        if 90 <= y <= 99
            str = strcat(str, "ninety")
            l = y%10
            if l == 1
                str = strcat(str, "one")
            end
            if l == 2
                str = strcat(str, "two")
            end
            if l == 3
                str = strcat(str, "three")
            end
            if l == 4
                str = strcat(str, "four")
            end
            if l == 5
                str = strcat(str, "five")
            end
            if l == 6
                str = strcat(str, "six")
            end
            if l == 7
                str = strcat(str, "seven")
            end
            if l == 8
                str = strcat(str, "eight")
            end
            if l == 9
                str = strcat(str, "nine")
            end
        end
    end
    str
end

function euler17()
    s::Uint64 = 0
    for i in 1:1000
        s += length(con(i))
    end
    println(dec(s))
end