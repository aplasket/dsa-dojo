require 'minitest'
require 'minitest/autorun'
require './queues/lib/queue.rb'

class QueueTest < Minitest::Test
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

  def test_it_gets_counts
    queue = Queue.new
    queue.enqueue("A")
    queue.enqueue("B")
    queue.enqueue("C")
    assert_equal(3, queue.count)
  end

  def test_it_gets_peek
    queue = Queue.new
    assert_nil(nil, queue.peek)

    queue.enqueue("A")
    queue.enqueue("B")
    queue.enqueue("C")
    assert_equal("A", queue.peek)

    queue.dequeue
    assert_equal("B", queue.peek)
  end

  def test_it_gets_last
    queue = Queue.new
    assert_nil(nil, queue.last)

    queue.enqueue("A")
    assert_equal("A", queue.last)

    queue.enqueue("B")
    assert_equal("B", queue.last)

    queue.enqueue("C")
    assert_equal("C", queue.last)
  end
  
  def test_it_gets_empty
    queue = Queue.new
    assert_equal(true, queue.empty?)

    queue.enqueue("A")
    assert_equal(false, queue.empty?)
  end
end