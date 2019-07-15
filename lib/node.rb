class Node

  #add parent reader and arg in add menthod for double linked list
  attr_accessor :left_node, :right_node
  attr_reader :score, :title

  def initialize(score, title)
    @title = title
    @score = score
    @left_node = nil
    @right_node = nil
  end

  def leaf?
    @right_node == nil && @left_node == nil
  end
end
