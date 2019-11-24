require_relative '../lib/visitor'

class ConcreteVisitor < Visitor
  def visit_component_with_value(element)
    "(#{element.visit_component_with_value})"
  end

  def visit_component_with_nil(element)
    "#{element.visit_component_with_nil}"
  end
end
