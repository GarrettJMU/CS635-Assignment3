

## Normal sort

context = BinarySearchTree.new(ConcreteForwardStrategy.new)
context.do_some_business_logic

## Reverse sort
context.strategy = ConcreteReverseStrategy.new
context.do_some_business_logic


class Node
  attr_reader :key, :left, :right

  def initialize(key)
    @key = key
    @left = nil
    @right = nil
  end

  def insert(new_key)
    if new_key <= @key
      @left.nil? ? @left = Node.new(new_key) : @left.insert(new_key)
    elsif new_key > @key
      @right.nil? ? @right = Node.new(new_key) : @right.insert(new_key)
    end
  end
end

# class BinarySearchTree
#   def initialize
#     @root = nil
#   end
#
#   def insert(key)
#     if @root.nil?
#       @root = Node.new(key)
#     else
#       @root.insert(key)
#     end
#   end
#
#   def in_order(node = @root, &block)
#     return if node.nil?
#     in_order(node.left, &block)
#     yield node
#     in_order(node.right, &block)
#   end
#
#   def pre_order(node = @root, &block)
#     return if node.nil?
#     yield node
#     in_order(node.left, &block)
#     in_order(node.right, &block)
#   end
#
#
#   # def post_order(node = @root, &block)
#   #   return if node.nil?
#   #   in_order(node.left, &block)
#   #   in_order(node.right, &block)
#   #   yield node
#   # end
#
#   def search(key, node = @root)
#     return nil if node.nil?
#     if key < node.key
#       search(key, node.left)
#     elsif key > node.key
#       search(key, node.right)
#     else
#       node
#     end
#   end
#
# end

tree = BinarySearchTree.new
tree.insert(50)
tree.insert(25)
tree.insert(75)
tree.insert(12)
tree.insert(37)
tree.insert(87)
tree.insert(63)
puts tree.inspect

puts "pre_order"
tree.pre_order do |node|
  puts node.key
end

puts "in_order"
tree.in_order do |node|
  puts node.key
end

puts "post_order"
tree.post_order do |node|
  puts node.key
end
