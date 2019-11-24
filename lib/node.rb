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
