class NullNode
  attr_accessor :parent, :value, :left, :right

  def initialize(parent)
    @parent = parent
  end

  def value
  end

  def left
  end

  def right
  end

  def set_parents_left_node(key)
    @parent.left = Node.new(key)
  end

  def set_parents_right_node(key)
    @parent.right = Node.new(key)
  end

  def set_root_node(key)
    @parent.root = Node.new(key)
  end

  def insert(*args)
    if @parent.instance_of?(Node)
      self.set_parents_left_node(args[0]) if @parent.left === self
      self.set_parents_right_node(args[0]) if @parent.right === self
    elsif @parent.instance_of?(BinarySearchTree)
      self.set_root_node(args[0]) if @parent.root === self
    end
  end

  def accept(visitor)
    visitor.visit_component_with_nil(self)
  end

  def visit_component_with_nil
    " ()"
  end
end
