# array1 = [5, 7, 2, 9, 1, 4, 0, 3, 8, 6]

array1 = []
10.times do
  array1.push(Random.new.rand(0..10))
end
p array1

(0..array1.length - 2).each do |i|
  (i + 1..array1.length - 1).each do |j|
    next unless array1[i] > array1[j]

    temp = array1[i]
    array1[i] = array1[j]
    array1[j] = temp
  end
end

print array1
