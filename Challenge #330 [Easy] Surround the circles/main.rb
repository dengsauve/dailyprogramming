# Challenge Input
points = [[1,1,2], [2,2,0.5], [-1,-3,2], [5,2,1]]

min_x = points[0][0].to_f
max_x = points[0][0].to_f
min_y = points[0][1].to_f
max_y = points[0][1].to_f

points.each do |point|
  x = point[0]
  y = point[1]
  r = point[2]

  min_x = (x - r).to_f if x - r < min_x
  max_x = (x + r).to_f if x + r > max_x
  min_y = (y - r).to_f if y - r < min_y
  max_y = (y + r).to_f if y + r > max_y
end

print "(#{min_x}, #{min_y}), " # bottom left
print "(#{min_x}, #{max_y}), " # top left
print "(#{max_x}, #{max_y}), "# top right
print "(#{max_x}, #{min_y})"# bottom right
