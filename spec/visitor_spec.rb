require 'spec_helper'
require_relative '../lib/visitor'

RSpec.describe Visitor do
  describe '#visit_component_with_value' do
    it 'should raise an error' do
      expect {Visitor.new.visit_component_with_value("")}.to raise_error(NotImplementedError)
    end
  end

  describe '#visit_component_with_nil' do
    it 'should raise an error' do
      expect {Visitor.new.visit_component_with_nil("")}.to raise_error(NotImplementedError)
    end
  end
end
