# frozen_string_literal: true

def func(array, left, right)
  pivot = left
  low = left + 1
  high = right

  if right > left
    while low < high
      low += 1 while array[low] <= array[pivot] && low < right
      high -= 1 while array[high] > array[pivot] && high > left
      next unless low < high

      temp = array[low]
      array[low] = array[high]
      array[high] = temp
    end
    if array[high] <= array[pivot]
      temp = array[pivot]
      array[pivot] = array[high]
      array[high] = temp
      pivot = high
    end
    func(array, left, pivot - 1)
    func(array, pivot + 1, right)
  end
end

# rand_arr = [1, 0, 10, 2, 10, 7, 1, 6, 2, 8]

rand_arr = []
10.times do
  rand_arr.push(Random.new.rand(0..10))
end

p rand_arr
func(rand_arr, 0, rand_arr.length - 1)

print rand_arr
