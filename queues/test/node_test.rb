require 'minitest'
require 'minitest/autorun'
require './queues/lib/node.rb'

class NodeTest < Minitest::Test
  def test_it_exists
    node = Node.new('A')

    assert_instance_of(Node, node)
    assert_equal('A', node.data)
    assert_nil(nil, node.next_node)
  end
end