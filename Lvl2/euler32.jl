function euler32()
    dig = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    sum = 0
    done = trues(1000000)
    for i in 1:factorial(length(dig))
        cur = nthperm(dig,i)
        x = cur[1]*10 + cur[2]
        y = cur[3]*100 + cur[4]*10 + cur[5]
        ans = cur[6]*1000 + cur[7]*100 + cur[8]*10 + cur[9]
        if ans == x*y && done[ans] == true
            printf("%d * %d == %d\n", x,y,ans)
            sum += ans
            done[ans] = false
        end
    end
    for i in 1:factorial(length(dig))
        cur = nthperm(dig,i)
        x = cur[1]
        y = cur[2]*1000 + cur[3]*100 + cur[4]*10 + cur[5]
        ans = cur[6]*1000 + cur[7]*100 + cur[8]*10 + cur[9]
        if ans == x*y && done[ans] == true
            printf("%d * %d == %d\n", x,y,ans)
            sum += ans
            done[ans] = false
        end
    end
    sum
end