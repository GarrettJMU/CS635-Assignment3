require_relative '../lib/strategy'

class ConcreteReverseStrategy < Strategy
  def search(data)
    data.sort.reverse
  end
end
