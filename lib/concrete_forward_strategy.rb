require_relative '../lib/strategy'

class ConcreteForwardStrategy < Strategy
  def search(key, node)
    if key < node.value
      search(key, node.left)
    elsif key > node.value
      search(key, node.right)
    else
      node
    end
  end

  def insert(new_value, node)
    if new_value <= node.value
      node.left.insert(new_value)
    elsif new_value > @value
      node.right.insert(new_value)
    end
  end
end
