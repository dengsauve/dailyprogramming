def map_maker(h, w, map=[])
    (1..h).each { map << [] }
    map.each { |row| (1..w).each { row << '.' } }
    map
end

def print_map(map)
    sleep (1.0/3.0)
    system('clear') or system('cls')
    puts '#'*(map[0].size+2)
    map.each { |row| print '#'; row.each { |col| print col}; puts '#' }
    puts '#'*(map[0].size+2)
end

input1 = '8 3 1'.split.map(&:to_i)
input2 = '15 4 2'.split.map(&:to_i)

h, w, v = input1
map = map_maker(h, w)
particle = [0,0]
y, x = 1, 1
map[particle[0]][particle[1]] = 'O'
print_map(map)
map[particle[0]][particle[1]] = '.'
particle[0] +=1
particle[1] +=1
map[particle[0]][particle[1]] = 'O'

while particle != [0,0] && particle!= [0,w-1] && particle != [h-1,w-1] && particle != [h-1,0]
    print_map(map)
    map[particle[0]][particle[1]] = '.'
    if particle[0] > 0 && particle[0] < h-1
        particle[0] += y
    else
        y = y *-1
        particle[0] += y
    end
    if particle[1] > 0 and particle[1] < w-1
        particle[1] += x
    else
        x = x*-1
        particle[1] += x
    end
    map[particle[0]][particle[1]] = 'O'
end
print_map(map)