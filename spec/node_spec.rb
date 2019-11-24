require 'spec_helper'
require_relative '../lib/node'

RSpec.describe Node do
  let(:value) { nil }
  subject { Node.new(value) }

  describe '#new' do
    context 'when a value is passed' do
      let(:value) { "foo" }
      it 'should store the value in the attributes' do
        expect(subject.value).to eq("foo")
      end
    end
  end

  describe '#accept' do
    let(:value) { "foo" }
    context 'when a value is padded' do
      it 'should return the current value with parentheses around it' do
        expect(subject.accept(ConcreteVisitor.new)).to eq("(foo)")
      end
    end
  end
end
