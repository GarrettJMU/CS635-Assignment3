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
end
