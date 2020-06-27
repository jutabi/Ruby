# frozen_string_literal: true

array1 = []
10.times do
  array1.push(Random.new.rand(0..10))
end
p array1

# (array1.length - 1).downto(1) do |i|
#   (1..i).each do |j|
#     next unless array1[j - 1] > array1[j]
#
#     temp = array1[j]
#     array1[j] = array1[j - 1]
#     array1[j - 1] = temp
#   end
# end

(array1.length - 1).downto(1) do |i|
  (0..i - 1).each do |j|
    next unless array1[j] > array1[j + 1]

    temp = array1[j]
    array1[j] = array1[j + 1]
    array1[j + 1] = temp
  end
end

p array1
