require_relative '../lib/visitor'

class ConcreteVisitor < Visitor
  def visit_component_with_value(element)
    puts "#{element.visit_component_with_value} + #{self.class}"
  end

  def visit_component_with_nil(element)
    puts "#{element.visit_component_with_nil} + #{self.class}"
  end
end
