class NullNode
  def initialize(parent)
    @parent = parent
  end

  def left
  end

  def right
  end

  def set_parents_left_node(key)
    @parent.left = Node.new(key)
  end

  def insert_left_value(key)

  end

  def set_parents_right_node(key)
    @parent.right = Node.new(key)
  end

  def set_root_node(key)
    @parent.root = Node.new(key)
  end

  def value(*)
  end

  def insert(key)
    self.set_parents_left_node(key) if @parent.left == self
    self.set_parents_right_node(key) if @parent.right == self
    self.set_root_node(key) if @parent.instance_of?(BinarySearchTree) && @parent.root == self
  end

  def accept(visitor)
    visitor.visit_component_with_nil(self)
  end

  def visit_component_with_nil
    "()"
  end
end
