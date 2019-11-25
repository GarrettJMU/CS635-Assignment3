require_relative '../lib/strategy'

class ConcreteReverseStrategy < Strategy
  def search(key, node)
    if node.keys_less_than(key.reverse, true)
      search(key, node.left)
    elsif node.keys_greater_than(key.reverse, true)
      search(key, node.right)
    else
      node
    end
  end

  def insert(new_value, node)
    reversed_new_value = new_value.reverse
    reversed_node_value = node.value.reverse

    if reversed_new_value <= reversed_node_value
      node.left.insert(new_value, self)
    elsif reversed_new_value > reversed_node_value
      node.right.insert(new_value, self)
    end
  end
end
