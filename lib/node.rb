require_relative '../lib/nil_node'

class Node < NullNode
  attr_accessor :value, :right, :left

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def left
    puts '#######'
  end

  def right
    puts '#########'
  end

  def accept(visitor)
    visitor.visit_component_with_value(self)
  end

end

#
# (5
#   (3
#     ()
#     (4 () ())
#   )
#   (10
#     ()
#     ()
#   )
# )
