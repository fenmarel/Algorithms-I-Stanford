median_sum = 0
current_array = []
k = 0
dex = nil

File.open('median.txt', 'r').each_line do |line|
  k += 1
  current_array << line.to_i
  current_array.sort!
  dex = k.odd? ? (((k+1)/2)-1) : ((k/2)-1)
  median_sum += current_array[dex]
end

puts median_sum % 10000
