require_relative '../lib/strategy'

class ConcreteForwardStrategy < Strategy
  def do_algorithm(data)
    data.sort
  end
end
