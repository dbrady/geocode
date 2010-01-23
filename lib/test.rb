require 'location'
require 'ruport'

points = [
  [0,0],
  [2,0],
  [-2, 0],
  [0,2],
  [0,-2],
  [0,358],
  [1,1],
].map { |lat,lng| Location.new(lat, lng)}


def build_table(method, pts)
  t = Ruport::Data::Table.new :column_names => ['Source'] + pts.map {|p| p.to_s}
  pts.each do |p1|
    row = { 'Source' => p1.to_s }
    pts.each do |p2|
      row[p2.to_s] = p1.send(method,(p2))
    end
    t << row
  end
  t
end

def print_table(method, pts)
  puts '-' * 80
  puts "#{method}:"
  puts build_table(method, pts)
  puts
end

print_table(:distance_to, points)
print_table(:midpoint_to, points)
print_table(:bearing_to, points)

