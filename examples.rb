## Normal sort

context = Context.new(ConcreteForwardStrategy.new)
context.do_some_business_logic

## Reverse sort
context.strategy = ConcreteReverseStrategy.new
context.do_some_business_logic
