require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "./lib/tree"

class TreeTest < Minitest::Test

  def setup
    @tree = Tree.new
  end

  def test_it_exists
    assert_instance_of Tree, @tree
  end

  def test_it_can_insert_nodes
    depth_1 = @tree.insert(61, "Bill & Ted's Excellent Adventure")
    depth_2 = @tree.insert(16, "Johnny English")
    depth_3 = @tree.insert(92, "Sharknado 3")
    depth_4 = @tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal @tree.root.score, 61
    assert_equal @tree.root.left_node.score, 16
    assert_equal @tree.root.right_node.score, 92
    assert_equal @tree.root.left_node.right_node.score, 50
    assert_equal depth_1, 0
    assert_equal depth_2, 1
    assert_equal depth_3, 1
    assert_equal depth_4, 2
  end

  def test_it_can_find_included_values
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert @tree.include?(61)
    refute @tree.include?(72)
  end
end
