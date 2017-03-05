############################################################
#
#  Name:         Dennis Sauve
#  Date:         03/05/17
#  Assignment:   dailyprogrammer challenge - Ricochet
#  Class:        -
#  Description:  A program that determines where a particle
#                traveling at 45 degrees will land.
#
#  Desired CLI:  ricochet.rb #runs with dummmy data
#                ricochet.rb h w v as numbers
#                ricochet.rb h w v m as numbers with m indicating no mapping
#
############################################################

def print_help
    system('clear') or system('cls')
    puts "\tHELP - RICOCHET\n
    \tricochet.rb - Cue ball, Corner Pocket (but which corner)\n
    \tUSAGE: height width velocity {OPT: -p particle_height particle_width; -m}\n
    \t-p: Specifies that you want a custom particle size (other than 1x1).
    \t-m: Specifies that you want the conclusion quickly, and no animation.\n
    \tINPUT:    height, width, velocity
    \theight:   the height of the table.
    \twidth:    the width of the table.
    \tvelocity: the velocity at which the particle is traveling.\n
    \tOUTPUT:   Corner, Number of Bounces, Time taken\n
    \tSUGGESTIONS: If you have a low velocity value (i.e. <10), I suggest -m as the animation could be lengthy."
    exit
end

def map_maker(h, w, map=[])
    (1..h).each { map << [] }
    map.each { |row| (1..w).each { row << ' ' } }
    map
end

def print_map(map)
    sleep (1.0/ARGV[2].to_i)
    system('clear') or system('cls')
    puts '#'*(map[0].size+2)
    map.each { |row| print '#'; row.each { |col| print col}; puts '#' }
    puts '#'*(map[0].size+2)
end

(ARGV.include? '-h') ? print_help : puts
(ARGV.include? '--help') ? print_help : puts
(ARGV.include? '-m') ? mapping=false : mapping=true
(ARGV.include? '-p') ? custom_p=true : custom_p=false
h, w, v, ph, pw = ARGV.map(&:to_i), 1, 1
if custom_p
    if ARGV[ARGV.index('-p')+1] < h && ARGV[ARGV.index('-p')+2] < w
        ph, pw = ARGV[ARGV.index('-p')+1], ARGV[ARGV.index('-p')+2]
    else
        puts "You can't have a particle bigger than the table!"
        exit
    end
end
bounce, moves = 0, 0
corners, map = {0=>'UL', (w-1)=>'UR',((h-1)+(w-1))=>'LR', (h-1)=>'LL'}, map_maker(h, w)

particle, x, y = [0,0], 1, 1

# Setting the Particle in place
map[particle[0]][particle[1]] = 'O'
print_map(map)
map[particle[0]][particle[1]] = ' '

# Getting the Ball Rolling, hehe
particle[0] +=1
particle[1] +=1
map[particle[0]][particle[1]] = 'O'
moves += 1

while particle != [0,0] && particle!= [0,w-1] && particle != [h-1,w-1] && particle != [h-1,0]
    print_map(map) if mapping
    map[particle[0]][particle[1]] = ' '
    if particle[0] > 0 && particle[0] < h-1
        particle[0] += y
    else
        bounce += 1
        y = y *-1
        particle[0] += y
    end
    if particle[1] > 0 and particle[1] < w-1
        particle[1] += x
    else
        bounce += 1
        x = x*-1
        particle[1] += x
    end
    moves += 1
    map[particle[0]][particle[1]] = 'O'
end

print_map(map)
time = moves.to_f / v.to_f
puts corners[particle[0]+particle[1]] + ' ' + bounce.to_s + ' ' + time.to_s
