require_relative '../lib/strategy'

class ConcreteForwardStrategy < Strategy
  def search(data)
    data.sort
  end
end
