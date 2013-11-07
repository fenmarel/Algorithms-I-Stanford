$input = Hash.new(false)
$total = 0

File.open('two_sum.txt', 'r').each_line do |line|
  $input[line.to_i] = true
end

$keys = $input.keys.sort

def two_sum(n)
  $keys.each do |key|
    if key > n/2
      return false
    end
    if $input[n-key] && key != (n-key)
      return true
    end
  end
  return false
end


(-10000..10000).each do |i|
  if two_sum(i)
    $total += 1
  end
  puts "iteration #{i}:  #{$total}"
end

puts $total

# 427
