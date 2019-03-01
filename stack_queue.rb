# DCP 53
# Apple

=begin
Implement a queue using two stacks.
=end


class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack << el
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end
end


class Queue
  def initialize
    @in_stack = Stack.new
    @out_stack = Stack.new
  end

  def enqueue(el)
    @in_stack.push el
  end

  def dequeue
    if @out_stack.peek.nil?
      until @in_stack.peek.nil?
        @out_stack.push(@in_stack.pop)
      end
    end

    @out_stack.pop
  end
end
