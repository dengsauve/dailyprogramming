f = File.open("input.txt").readlines()

rev, exp = [], []
expl = false

f.each do | l |
    l == "Expenses\n" ? expl = true : nil
    unless expl
        l == "Revenue\n" || l == "\n" ? nil : rev << l 
    else
        l == "Expenses\n" || l == "\n" ? nil : exp << l
    end
end

def parse_table(str)
    names, products = [], []
    str.each_with_index { | l, i | i == 0 ? names << l.split(" ") : products << l.split(" ") }
    return [names, products]
end

r_data = parse_table(rev)
e_data = parse_table(exp)

def compare_tables(tbl_a, tbl_b)
    names = tbl_a[0]
    a_data, b_data, n_data = tbl_a[1], tbl_b[1], []
    a_data.each_with_index do | l, i |
        new_line = []
        l.each_with_index { |ll, j| j == 0 ? new_line << ll : new_line << ll.to_i - b_data[i][j].to_i }
        n_data << new_line
    end
    return [names, n_data]
end

c_data = compare_tables(r_data, e_data)

def commissions(c_data)
    names, dif, coms = c_data[0][0], c_data[1], []
    names.each { |n| coms << [n, 0] }

    dif.each_with_index do | l |
        l.each_with_index do | d, i |
            if d.is_a? Integer
                d > 0 ? coms[i - 1][1] += (d * 0.062).round(2) : nil
            end
        end
    end
    return coms
end

commissions(c_data).each { |d| puts "#{d[0]}\t%.2f" % d[1] }