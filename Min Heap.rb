# frozen_string_literal: true

class MaxHeap
  def initialize
    @heap = []
  end

  def insert_node(value)
    # 마지막 노드 자리에 값 삽입
    @heap.push(value)
    # 부모와 값을 비교
    # 부모 => ((heap.length - 1) / 2)
    # 프로그래밍에서는 숫자가 0부터 시작함으로 -1을 해야 하지만
    # -1을 하고 시작하면 배열의 인덱스가 0 1 2 ... 이렇게 되는데 3번째 노드의 부모가
    # 1로 잡혀버린다.(2 / 2 = 1) 그래서 -1을 하는 대신 아래의 부모를 찾는 연산(25)에서
    # +1한 child를 이용해 부모를 찾고 그 값에 다시 -1을 하여 0부터 시작하는 인덱스에
    # 맞게 부모를 설정해준다.
    child = @heap.length - 1
    # 입력한 수의 인덱스(child)가 1이상이라면 (부모 노드가 존재한다면 (2번째 노드부터))
    while child >= 1
      # 부모 노드는 child / 2의 몫
      # 위의 주석에서 나온 부모를 찾는 연산
      parent = ((child + 1) / 2) - 1
      # 자식이 부모보다 작다면 교환한다.
      if @heap[child] < @heap[parent]
        temp = @heap[child]
        @heap[child] = @heap[parent]
        @heap[parent] = temp
        # 자식이 더 작다면 부모 위치로 가서 다시 부모를 탐색하도록 인덱스 전달
        child = parent
      else
        # 부모가 인덱스가 더 작다면 반복문을 빠져나가기 위해서 child에 0을 입력
        child = 0
      end
    end
  end

  def delete_node
    # @heap[0] = nil
    # @heap[0] = @heap.pop

    # @heap.delete_at(0)
    # @heap.insert(0, @heap.pop)

    # 첫번째 요소(루트, 최대값(최소값))를 삭제한다.
    @heap.shift
    index = 0
    # 루트를 삭제하고 마지막 노드를 루트자리에 옮긴다
    @heap.unshift(@heap.pop)
    # 자식이 존재한다면 반복
    while @heap[((index + 1) * 2) - 1] != nil
      # 새로 생긴 루트와 자식 노드(j * 2, (j * 2) + 1)들을 비교한다.
      # 세개의 값 중 가장 작은 값이 루트 노드가 된다.
      # 배열은 0부터 시작하기 때문에 먼저 +1을 해서 자식을 구해주고
      # -1을 하여 배열의 연산에 맞게 변환해준다.
      child1 = ((index + 1) * 2) - 1
      child2 = ((index + 1) * 2)
      # 첫번째 자식은 존재하지만 두번째 자식은 존재하지 않거나
      # 첫번째 자식이 두번째 자식보다 작다면 첫번째 자식과 비교
      compare = if @heap[child2].nil? || @heap[child1] < @heap[child2]
                  child1
                else
                  child2
                end
      if @heap[index] > @heap[compare]
        temp = @heap[index]
        @heap[index] = @heap[compare]
        @heap[compare] = temp
        # 자식이 더 작다면 자식의 위치로 가서 다시 자식을 탐색
        index = compare
      else
        # 자식이 더 크거나 같다면 반복문을 빠져나가기 위해 index 값 변경
        index = @heap.length
      end
    end
  end

  def read_node
    p @heap
  end
end

heap = MaxHeap.new
heap.insert_node(2)
heap.insert_node(3)
heap.insert_node(5)
heap.insert_node(1)
heap.insert_node(7)
heap.insert_node(6)
heap.read_node
heap.delete_node
heap.read_node
heap.delete_node
heap.read_node
