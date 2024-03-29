require "./lib/node"

class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(score, title)
    return nil if title.empty? || score.nil?
    current_node = @root
    depth = 0
    loop do
      if current_node.nil?
        current_node = Node.new(score, title)
        @root = current_node if @root.nil?
        return depth
      elsif score > current_node.score && current_node.right_node.nil?
        current_node.right_node = Node.new(score, title)
        return depth + 1
      elsif score < current_node.score && current_node.left_node.nil?
        current_node.left_node = Node.new(score, title)
        return depth + 1
      elsif score > current_node.score
        current_node = current_node.right_node
        depth += 1
      elsif score < current_node.score
        current_node = current_node.left_node
        depth += 1
      end
    end
  end

  def include?(score)
    return nil if @root.nil?
    current_node = @root
    loop do
      current_node = current_node.left_node if score < current_node.score
      current_node = current_node.right_node if score > current_node.score
      return true if current_node.score == score
      return false if current_node.leaf?
    end
  end

  def depth_of(score)
    return nil if @root.nil?
    current_node = @root
    depth = 0
    loop do
      if score < current_node.score
        current_node = current_node.left_node
        depth += 1
      elsif score > current_node.score
        current_node = current_node.right_node
        depth += 1
      end
      return depth if current_node.score == score
      return nil if current_node.leaf?
    end
  end

  def min
    return nil if @root.nil?
    current_node = @root
    loop do
      current_node = current_node.left_node if !current_node.left_node.nil?
      return {current_node.title => current_node.score} if current_node.left_node.nil?
    end
  end

  def max
    return nil if @root.nil?
    current_node = @root
    loop do
      current_node = current_node.right_node if !current_node.right_node.nil?
      return {current_node.title => current_node.score} if current_node.right_node.nil?
    end
  end
end
