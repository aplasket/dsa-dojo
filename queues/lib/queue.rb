class Queue
  attr_reader :head

  def initialize
    @head = nil
  end

  def enqueue(element)
    new_node = Node.new(element)
    if @head.nil?
      @head = new_node
    else
      current = @head
      until current.next_node.nil?
        current = current.next_node
      end
      current.next_node = new_node
    end
  end

  def count
    if @head.nil?
      count = 0
    else
      current = @head
      count = 1
      until current.next_node.nil?
        count += 1
        current = current.next_node
      end
    end
    count
  end

  def dequeue
    current_node = @head.data
    @head = @head.next_node
    current_node
  end

  def peek
    return nil if @head.nil?
    @head.data
  end

  def last
    return nil if @head.nil?
    current = @head
    until current.next_node.nil?
      current = current.next_node
    end
    current.data
  end
end