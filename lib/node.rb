require_relative '../lib/nil_node'

class Node
  attr_accessor :value, :right, :left

  def initialize(value)
    @value = value
    @left = NullNode.new(self)
    @right = NullNode.new(self)
  end

  def insert(new_key)
    if new_key <= @value
      @left.insert(new_key)
    elsif new_key > @value
      @right.insert(new_key)
    end
  end

  def accept(visitor)
    visitor.visit_component_with_value(self)
  end

  def visit_component_with_value
    value
  end
end

#
# (5
#   (3
#     ()
#     (4
#       ()
#       ()
#     )
#   )
#   (10
#     ()
#     ()
#   )
# )
