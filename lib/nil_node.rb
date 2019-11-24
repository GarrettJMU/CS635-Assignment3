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

  def value(*)
  end

  def insert(key)
    @parent.left == self ? self.set_parents_left_node(key) : self.set_parents_right_node(key)
  end

  def accept(visitor)
    visitor.visit_component_with_nil(self)
  end

  def visit_component_with_nil
    "()"
  end
end
