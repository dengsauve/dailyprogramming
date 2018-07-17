f = File.open("input.txt").readlines()

## Grab rev and exp lines
rev = []
exp = []

expl = false

f.each do | l |
    if l == "Expenses\n"
        expl = true
    end
    unless expl
        unless l == "Revenue \n" || l == "\n"
            rev << l
        end
    else
        unless l == "Expenses\n" || l == "\n"
            exp << l
        end
    end
end

puts "raw"
puts rev.inspect, exp.inspect

def parse_table(str)
    names, products = [], []
    str.each_with_index do | l, i |
        if i == 0
            names << l.split(" ")
        else
            products << l.split(" ")
        end
    end
    return [names, products]
end

r_data = parse_table(rev)
e_data = parse_table(exp)

puts "DATA"
puts r_data.inspect, e_data.inspect

def compare_tables(tbl_a, tbl_b)
    names = tbl_a[0]
    a_data, b_data, n_data = tbl_a[1], tbl_b[1], []
    a_data.each_with_index do | l, i |
        new_line = []
        l.each_with_index do |ll, j|
            if j == 0
                new_line << ll
            else
                new_line << ll.to_i - b_data[i][j].to_i
            end
        end
        n_data << new_line
    end
    return [names, n_data]
end

c_data = compare_tables(r_data, e_data)
puts "COMPARED", c_data