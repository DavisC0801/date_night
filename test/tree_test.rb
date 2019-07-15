require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "./lib/tree"

class TreeTest < Minitest::Test

  def setup
    @t = Tree.new
  end

  def test_it_exists
    assert_instance_of Tree, @t
  end
end
