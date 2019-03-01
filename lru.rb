# DCP 52
# Google

=begin
Implement an LRU cache. It should be able to be initialized with a cache size n,
and contain the following methods:

- set(key, value): sets key to value. If there are already n items in the cache,
  and we are adding a new item, then it should also remove the least recently
  used item.
- get(key): gets the value at key. If no such key exists, return null.

=end

class Node
  attr_accessor :next, :previous, :value
  def initialize(value)
    @value = value
  end
end

class LinkedList
  attr_accessor :head, :tail, :length
  def initialize
    @length = 0
  end

  def add(el)
    if @head.nil?
      @head = el
      @tail = el
    else
      @tail.next = el
      @tail = el
    end
    @length += 1
  end
end

class LRUCache
  def initialize(n)
    @hash_map = {}
    @linked_list = LinkedList.new
    @max = n
  end

  def set(key, value)
    if @hash_map[key]
      node = @hash_map[key]
      node.value = value
      next_node = node.next
      previous_node = node.previous
      previous_node.next = next_node if previous_node
      next_node.previous = previous_node if next_node
    else
      node = Node.new(value)
      @hash_map[key] = node
      @linked_list.add(node)
    end

    if @linked_list.length > @max
      @linked_list.head =  @linked_list.head.next
      @linked_list.length -= 1
    end
  end

  def get(key)
    @hash_map[key]&.value
  end

  def length
    @linked_list.length
  end
end

cache = LRUCache.new(5)

cache.set(:a, 1)
cache.set(:b, 2)
puts cache.length # 2
puts cache.get(:a) # 1

cache.set(:a, 2)
puts cache.length # 2
puts cache.get(:a) # 2

cache.set(:c, 3)
cache.set(:d, 4)
cache.set(:e, 5)
cache.set(:f, 6)

puts cache.length # 5
puts cache.get(:a) # 2
puts cache.get(:f) # 6
