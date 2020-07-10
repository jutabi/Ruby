load 'List Accuracy.rb'

def insertion(list, gap, i)
  start = i
  while start + gap < list.length
    comp2 = start + gap
    start += gap
    while comp2 - gap >= 0
      comp1 = comp2 - gap
      if list[comp1] > list[comp2]
        temp = list[comp1]
        list[comp1] = list[comp2]
        list[comp2] = temp
        comp2 -= gap
      else
        comp2 = 0
      end
    end
  end
end

def shell(list, prev_gap)
  # gap을 정한다. (홀수)
  # 0부터 + gap을 하여 삽입 정렬을 실행한다.
  # gap이 1이 될 때 까지 재귀함수로 반복한다.
  if prev_gap > 1
    gap = (prev_gap / 2).even? ? prev_gap / 2 + 1 : prev_gap / 2
    (0..gap - 1).each do |i|
      # 삽입 정렬
      insertion(list, gap, i)
    end
    shell(list, gap)
  end
end

list = []
10.times do
  list.push(Random.new.rand(0..10))
end
puts "before: #{list}"
origin = list.clone

shell(list, list.length)
puts "after: #{list}"

acc = ListAccuracy.new
acc.accuracy_test(origin, list)
