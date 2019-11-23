class Context
  attr_accessor :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def strategy(strategy)
    @strategy = strategy
  end

  def do_some_business_logic
    @strategy.do_algorithm(%w[a b c d e])
  end
end
