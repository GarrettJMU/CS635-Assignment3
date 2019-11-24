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
      node.left.insert(new_value, self)
    elsif new_value > node.value
      node.right.insert(new_value, self)
    end
  end
end
