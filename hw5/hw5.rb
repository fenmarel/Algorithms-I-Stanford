
require 'set'

def shortest_path(graph)
  infinity = +1.0/0.0
  explored = Set.new([1])
  frontier = Set.new([])
  shortest_to = Hash.new(infinity)
  shortest_to[1] = 0
  
  graph[1].each do |node|
    key = node.first
    frontier.add(key)
    shortest_to[key] = graph[1][key]
  end
  
  while not frontier.empty?  
    tmp = []
    frontier.each{ |k| tmp << [shortest_to[k], k] }
    min_val, min_key = tmp.min  
    explored.add(min_key)
    frontier.delete(min_key)

    graph[min_key].each do |node|
      key = node.first
      if not explored.include? key
        shortest_to[key] = [shortest_to[key], shortest_to[min_key] + graph[min_key][key]].min
        frontier.add(key)
      end
    end
  end
  shortest_to
end


data = {}
File.open('DijkstraData.txt', 'r').each_line do |line|
  tmp = line.split
  key = tmp.shift.to_i
  tmp = tmp.map{|n| n.split(',').map {|j| j.to_i}}
  data[key] = tmp.inject(Hash.new([])){ |h,(k,v)| h[k] = v; h }
end


paths = shortest_path(data)
ans = []
[7,37,59,82,99,115,133,165,188,197].each do |n|
  ans << paths[n]
end

puts ans.inspect


# [2599, 2610, 2947, 2052, 2367, 2399, 2029, 2442, 2505, 3068]

