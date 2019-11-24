require_relative '../lib/strategy'

class ConcreteReverseStrategy < Strategy
  def do_algorithm(data)
    data.sort.reverse
  end
end
