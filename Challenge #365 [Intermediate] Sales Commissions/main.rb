f = File.open("input.txt").readlines()

## Grab rev and exp lines
rev = []
exp = []

expl = false

f.each do | l |
    if l == "Expenses\n"
        expl == true
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
puts rev, exp

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
puts r_data, e_data

def compare_tables(tbl_a, tbl_b)
    
end