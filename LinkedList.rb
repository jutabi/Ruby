# frozen_string_literal: true

class Node
  attr_accessor :prev, :value, :next
  def initialize(left, value, right)
    @prev = left
    @value = value
    @next = right
  end
end

class LinkedList
  def initialize(value)
    @head = Node.new(nil, value, nil)
  end

  def insert_node(value)
    cur_node = @head
    if @head.nil?
      @head = Node.new(nil, value, nil)
    else
      cur_node = cur_node.next until cur_node.next.nil?
      cur_node.next = Node.new(cur_node, value, nil)
    end
  end

  def delete_node(value)
    cur_node = @head
    if cur_node.value == value
      if cur_node.next.nil?
        @head = nil
      else
        @head = cur_node.next
        @head.prev = nil
      end
    else
      until cur_node.next.nil?
        cur_node = cur_node.next
        next unless cur_node.value == value

        cur_node.prev.next = cur_node.next
        cur_node.next.prev = cur_node.prev unless cur_node.next.nil?
      end
    end
  end

  def read_nodes
    cur_node = @head
    until cur_node.nil?
      print "#{cur_node.value},"
      cur_node = cur_node.next
    end
    puts
  end
end

list = LinkedList.new(0)
list.insert_node(1)
list.insert_node(2)
list.insert_node(1)
list.insert_node(3)
print 'result: '
list.read_nodes

list.delete_node(1)
print 'result: '
list.read_nodes

list.delete_node(0)
print 'result: '
list.read_nodes

list.delete_node(3)
print 'result: '
list.read_nodes

list.delete_node(2)
print 'last result: '
list.read_nodes

list.insert_node(3)
print 'result: '
list.read_nodes