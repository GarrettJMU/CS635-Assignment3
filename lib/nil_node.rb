class NullNode
  def left(*)
  end

  def right(*)
  end

  def value(*)
  end

  def accept(visitor)
    visitor.visit_component_with_nil(self)
  end
end
