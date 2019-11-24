class NullNode
  attr_accessor :parent, :value

  def initialize(parent)
    @parent = parent
    @value = nil
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

  def insert(key)
    if @parent.instance_of?(Node)
      self.set_parents_left_node(key) if @parent.left === self
      self.set_parents_right_node(key) if @parent.right === self
    elsif @parent.instance_of?(BinarySearchTree)
      self.set_root_node(key) if @parent.root === self
    end
  end

  def accept(visitor)
    visitor.visit_component_with_nil(self)
  end

  def visit_component_with_nil
    "()"
  end
end
