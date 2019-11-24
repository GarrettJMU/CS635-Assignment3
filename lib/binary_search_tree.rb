require_relative '../lib/concrete_visitor'
require_relative '../lib/node'
require_relative '../lib/nil_node'

class BinarySearchTree
  attr_accessor :strategy, :root

  def initialize(strategy)
    @strategy = strategy
    @root = NullNode.new(self)
  end

  def strategy(strategy)
    @strategy = strategy
  end

  def insert(value)
    @root.insert(value)
  end

  def visualize
    tree = ""
    if @root.nil?
      tree += "()"
    else
      self.pre_order do |node|
        tree += node.accept(ConcreteVisitor.new)
      end
    end

    tree
  end

  def in_order(node = @root, &block)
    return if node.nil?
    in_order(node.left, &block)
    yield node
    in_order(node.right, &block)
  end

  def pre_order(node = @root, &block)
    return if node.nil?
    yield node
    in_order(node.left, &block)
    in_order(node.right, &block)
  end

  def search(key, node = @root)
    @strategy.search(key, node)
  end
end
