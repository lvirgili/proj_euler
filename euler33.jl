function euler33()
    for a in 1:9, b in 0:9, c in 0:9
        num = 10*a + b; den = 10*b + c
        if num < den
            frac = num//den
            if c != 0 && frac == a//c
                printf("%d // %d == %d // %d\n",num,den,a,c)
            end
        end
    end
end