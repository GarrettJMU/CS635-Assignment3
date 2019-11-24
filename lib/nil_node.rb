class NullNode
  def initialize(parent)
    @parent = parent
  end

  def left(key)
    @parent.left = Node.new(key)
  end

  def insert_left_value(key)

  end

  def right(key)
    @parent.right = Node.new(key)
  end

  def value(*)
  end

  def insert(key)
    @parent.left == self ? self.left(key) : self.right(key)
  end

  def accept(visitor)
    visitor.visit_component_with_nil(self)
  end

  def visit_component_with_nil
    "()"
  end
end
