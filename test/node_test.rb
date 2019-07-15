require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "./lib/node"

class NodeTest < Minitest::Test

  def setup
    @n = Node.new(50, "test")
  end

  def test_it_exists
    assert_instance_of Node, @n
  end

  def test_it_has_attributes
    assert @n.score, 50
    assert @n.title, "test"
  end

  def test_it_has_nil_nodes_by_default
    assert_nil @n.left_node
    assert_nil @n.right_node
  end

  def test_it_can_determine_if_leaf
    assert @n.leaf?
    @n.left_node = Node.new(40, "test2")
    refute @n.leaf?
  end
end
