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
end
