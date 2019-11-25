require_relative '../lib/nil_node'

class Node
  attr_accessor :value, :right, :left

  def initialize(value)
    @value = value
    @left = NullNode.new(self)
    @right = NullNode.new(self)
  end

  def insert(new_key, strategy)
    strategy.insert(new_key, self)
  end

  def keys_less_than(key, reverse = false)
    key < (reverse ? @value.reverse : @value)
  end

  def keys_greater_than(key, reverse = false)
    key > (reverse ? @value.reverse : @value)
  end

  def accept(visitor)
    visitor.visit_component_with_value(self)
  end

  def visit_component_with_value
    value
  end
end
