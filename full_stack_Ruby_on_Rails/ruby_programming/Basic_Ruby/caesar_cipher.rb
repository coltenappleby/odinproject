def caesar_cipher(str, int)

    # .ord
    #   A ->  Z | 'a' -> 'z' 
    #  65 -> 90 | 97  -> 122

    result = ''

    arr = str.split('')
    arr.each do |char|
        curr_num = char.ord
        new_num = curr_num+int
        if curr_num < 65 || (curr_num > 90  && curr_num < 97) || curr_num > 122
            result << char
        elsif new_num > 90 && new_num < 97
            new_num = 64+(new_num-90)
            result << new_num.chr
        elsif new_num > 122
            new_num = 96+(new_num-122)
            result << new_num.chr

        else
            result << new_num.chr
        end
    end
    return result;
end

puts caesar_cipher("What a string!", 5)