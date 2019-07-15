require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "./lib/tree"

class TreeTest < Minitest::Test

  def setup
    @tree = Tree.new
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_it_exists
    assert_instance_of Tree, @tree
  end

  def test_it_can_insert_nodes
    t = Tree.new
    depth_1 = t.insert(61, "Bill & Ted's Excellent Adventure")
    depth_2 = t.insert(16, "Johnny English")
    depth_3 = t.insert(92, "Sharknado 3")
    depth_4 = t.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal t.root.score, 61
    assert_equal t.root.left_node.score, 16
    assert_equal t.root.right_node.score, 92
    assert_equal t.root.left_node.right_node.score, 50
    assert_equal depth_1, 0
    assert_equal depth_2, 1
    assert_equal depth_3, 1
    assert_equal depth_4, 2
  end

  def test_it_can_find_included_values
    assert @tree.include?(61)
    refute @tree.include?(72)
  end

  def test_it_can_find_depth_of_values_in_tree
    assert_equal(@tree.depth_of(92), 1)
    assert_equal(@tree.depth_of(50), 2)
    assert_nil @tree.depth_of(123)
  end

  def test_it_can_find_the_maximum_scoring_node
    assert_equal(@tree.max, {"Sharknado 3"=>92})
  end

  def test_it_can_find_the_minimum_scoring_node
    assert_equal(@tree.min, {"Johnny English"=>16})
  end
end
