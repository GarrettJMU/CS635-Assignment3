class Node < NullNode
  attr_accessor :value

  def initialize(value)
    @value = value
    @left_value = nil
    @right_value = nil
  end

  def insert(new_node)

  end

  def left
    puts '#######'
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
