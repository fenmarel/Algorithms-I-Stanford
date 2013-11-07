def inversions(xs)  
  @count = 0
  
  def merge_sort(m)
      if m.length <= 1
          return m
      end
   
      middle = m.length / 2
      left = m[0,middle]
      right = m[middle..-1]
   
      left = merge_sort(left)
      right = merge_sort(right)
      merge(left, right)
  end
   
  def merge(left, right)
      result = []
      
   
      until left.empty? || right.empty?
          # change the direction of this comparison to change the direction of the sort
          if left.first <= right.first
              result << left.shift
          else
              result << right.shift
              @count += left.length
          end
      end
   
      unless left.empty?
          result += left
      end
      unless right.empty?
          result += right
      end
      result
  end
  merge_sort(xs)
  @count
end

input_array = []
File.open("hw1_input.txt", "r").each_line do |line|
  line = line.delete("\n").to_i
  input_array << line
end

puts inversions(input_array)
# 2407905288

