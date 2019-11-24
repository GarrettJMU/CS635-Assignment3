require_relative '../lib/strategy'

class ConcreteReverseStrategy < Strategy
  def search(key, node)
    reversed_key = key.reverse
    reversed_node_value = node.value.reverse

    if reversed_key < reversed_node_value
      search(key, node.left)
    elsif reversed_key > reversed_node_value
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
