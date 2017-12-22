module Constant

    function artir()
        global RANDOMITERASYONU = RANDOMITERASYONU + 1
    end

    function birle()
        global RANDOMITERASYONU = 1
    end

    # Dosyadan okunan string değeri parçalayıp float array haline getirir
    function stringToIntArray(exp)
        ret = []
        withoutComma = split(exp, ',')
        for i in withoutComma
            push!(ret, parse(Int, i))
        end
        return ret
    end

    # Dosyadan okunan string değeri parçalayıp float array haline getirir
    function stringToFloatArray(exp)
        ret = []
        withoutComma = split(exp, ',')
        for i in withoutComma
            push!(ret, parse(Float64, i))
        end
        return ret
    end

    function initialInputs()
        # fileStream = open("../test1.txt") # =>    258 + 259 + 261 + 258 + 257
        # fileStream = open("../test2.txt") # =>    253 + 254 + 252 + 253 + 254
        # fileStream = open("../test3.txt") # =>    254 + 253 + 252 + 256 + 252
        fileStream = open("../test4.txt") # =>      251 + 249 + 250 + 251 + 249
        lines = readlines(fileStream)

        global POPULASYONBOYUTU =       parse(Int, lines[2])
        global EBEBEYNSAYISI =          parse(Int, lines[3])
        global MUTASYONOLASILIGI =      parse(Float64, lines[4])
        global ITERASYONSAYISI =        parse(Int, lines[5])
        global CANTABOYUTU =            parse(Int, lines[6])
        global w =                      stringToIntArray(lines[7])
        global v =                      stringToIntArray(lines[8])
        global RANDOMLAR =              stringToFloatArray(lines[1])
        global BASLANGICOLASILIGI =     0.5
        global RANDOMITERASYONU =       0

        close(fileStream)
    end

end
