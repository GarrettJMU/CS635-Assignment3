require_relative '../lib/strategy'

class ConcreteReverseStrategy < Strategy
  def search(key, node)
    if key > node
      search(key, node)
    elsif key < node
      search(key, node)
    else
      node
    end
  end
end
