# frozen_string_literal: true

load 'List Accuracy.rb'
# 함수가 실행되면
# 리스트를 반절로 나눈다.
# 두개의 부분 리스트를 다시 재귀함수로 넣는다.
# 반환된 부분 리스트를 값을 한개씩 비교하여 정렬한다.

def merge(list, left, right)
  if left < right
    mid = ((right - left) / 2) + left
    merge(list, left, mid)
    merge(list, mid + 1, right)

    l1 = left
    l2 = mid + 1
    temp = []

    while l1 <= mid && l2 <= right
      if list[l1] <= list[l2]
        temp.push(list[l1])
        l1 += 1
      else
        temp.push(list[l2])
        l2 += 1
      end
    end
    if l1 == mid + 1 && l2 <= right
      (l2..right).each do |i|
        temp.push(list[i])
      end
    elsif l2 == right + 1 && l1 <= mid
      (l1..mid).each do |j|
        temp.push(list[j])
      end
    end

    t = 0
    (left..right).each do |k|
      list[k] = temp[t]
      t += 1
    end
  end
end

list = []
10.times do
  list.push(Random.new.rand(0..10))
end
puts "before: #{list}"
origin = list.clone

merge(list, 0, list.length - 1)
puts "after: #{list}"

acc = ListAccuracy.new
acc.accuracy_test(origin, list)
