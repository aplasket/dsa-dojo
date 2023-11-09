require 'minitest'
require 'minitest/autorun'
require './queues/lib/queue.rb'

class StackTest < Minitest::Test
  def test_it_enqueues
    queue = Queue.new
    queue.enqueue("A")
    queue.enqueue("B")
    queue.enqueue("C")
    assert_equal(3, queue.count)
    assert_equal("A", queue.head.data)
    assert_equal("B", queue.head.next_node.data)
    assert_equal("C", queue.head.next_node.next_node.data)
  end

  def test_it_dequeues
    queue = Queue.new
    queue.enqueue("A")
    queue.enqueue("B")
    queue.enqueue("C")
    assert_equal("A", queue.dequeue)
    assert_equal("B", queue.head.data)
    assert_equal("B", queue.dequeue)
    assert_equal("C", queue.head.data)
    assert_equal("C", queue.dequeue)
    assert_nil(nil, queue.head)
  end

end