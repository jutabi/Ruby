# frozen_string_literal: true

arr = []
10.times do
  arr.push(Random.new.rand(0..10))
end
p arr

# 1
# (1..arr.length - 1).each do |i|
#   (i - 1).downto(0) do |j|
#     next unless arr[i] < arr[j]
#
#     temp = arr[i]
#     arr[i] = arr[j]
#     arr[j] = temp
#     i = j
#   end
# end

# 2
(1..arr.length - 1).each do |i|
  val1 = arr[i]
  (i - 1).downto(0) do |j|
    if val1 < arr[j]
      arr[j + 1] = arr[j]
      arr[j] = val1
    else
      break
    end
  end
end

p arr
