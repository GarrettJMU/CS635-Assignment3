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
end
