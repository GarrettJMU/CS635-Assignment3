require 'spec_helper'
require_relative '../lib/concrete_visitor'

RSpec.describe ConcreteVisitor do
  let(:mocked_class) { double('element') }
  subject { ConcreteVisitor.new.visit_component_with_value(mocked_class) }
  describe '#visit_component_with_value' do
    it 'should should call element with correct method' do
      expect(mocked_class).to receive(:visit_component_with_value)
      subject
    end
  end

  describe '#visit_component_with_nil' do
    subject { ConcreteVisitor.new.visit_component_with_nil(mocked_class) }
    it 'should should call element with correct method' do
      expect(mocked_class).to receive(:visit_component_with_nil)
      subject
    end
  end
end
