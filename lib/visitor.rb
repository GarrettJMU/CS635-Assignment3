class Visitor
  def visit_component_with_value(_element)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def visit_component_with_nil(_element)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# # The client code can run visitor operations over any set of elements without
# # figuring out their concrete classes. The accept operation directs a call to
# # the appropriate operation in the visitor object.
# def client_code(components, visitor)
#   # ...
#   components.each do |component|
#     component.accept(visitor)
#   end
#   # ...
# end
#
# components = [ConcreteComponentA.new, ConcreteComponentB.new]
#
# puts 'The client code works with all visitors via the base Visitor interface:'
# visitor1 = ConcreteVisitor1.new
# client_code(components, visitor1)
#
# puts 'It allows the same client code to work with different types of visitors:'
# visitor2 = ConcreteVisitor2.new
# client_code(components, visitor2)
