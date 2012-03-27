function load_matrix(file::String, nr, nc)
    f = open(file)
    a = Array(Int64, nr, nc)
    for i in 1:nr
        row = split(chomp(readline(f)), (' '), false)
        for j in 1:nc
            a[i,j] = int64(row[j])
        end
    end
    a
end

function diag_prod_right(a)
    max::Uint64 = 0
    for i in 1:17
        for j in 1:17
            prod::Int64 = a[i,j] * a[i+1,j+1] * a[i+2,j+2] * a[i+3,j+3]
            if max < prod
                max = prod
            end
        end
    end
    max
end

function diag_prod_left(a)
    max::Uint64 = 0
    for i in 4:17
        for j in 4:17
            prod::Int64 = a[i,j] * a[i+1,j-1] * a[i+2,j-2] * a[i+3,j-3]
            if max < prod
                max = prod
            end
        end
    end
    max
end

function hor_prod(a)
    max::Int64 = 0
    for i in 1:20, j in 1:17
        prod::Int64 = a[i,j] * a[i,j+1] * a[i,j+2] * a[i,j+3]
        if prod > max
            max = prod
        end
    end
    max
end

function ver_prod(a)
    max::Int64 = 0
    for i in 1:20, j in 1:17
        prod::Int64 = a[i,j] * a[i+1,j] * a[i+2,j] * a[i+3,j]
        if prod > max
            max = prod
        end
    end
    max
end

function euler11()
    a = load_matrix("/tmp/file.txt",20,20)
    print(dec(max(diag_prod_left(a),diag_prod_right(a),hor_prod(a),ver_prod(a))))
end