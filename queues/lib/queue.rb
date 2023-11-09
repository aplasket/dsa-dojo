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

 
end