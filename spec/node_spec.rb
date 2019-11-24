require 'spec_helper'
require_relative '../lib/node'
require_relative '../lib/concrete_reverse_strategy'
require_relative '../lib/concrete_forward_strategy'

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

  describe '#insert' do
    let(:value) { 'b' }

    context 'when alphabetical' do
      let(:strategy) {ConcreteForwardStrategy.new}

      context 'when it is less than' do
        it 'should add it as the left node' do
          subject.insert('a', strategy)
          expect(subject.left.value).to eq('a')
        end
      end

      context 'when it is equal to' do
        it 'should add it as the left node' do
          subject.insert('b', strategy)
          expect(subject.left.value).to eq('b')
        end
      end

      context 'when it is greater than' do
        it 'should add it as the right node' do
          subject.insert('c', strategy)
          expect(subject.right.value).to eq('c')
        end
      end

      context 'when there are multiple values' do
        it 'should add it to the correct nodes' do
          subject.insert('d', strategy)
          subject.insert('a', strategy)
          expect(subject.left.value).to eq('a')
          expect(subject.right.value).to eq('d')
        end
      end

      context 'when the node is full' do
        it 'should create a new node' do
          subject.insert('a', strategy)
          subject.insert('c', strategy)
          # subject.insert('d', strategy)
          expect(subject.left.value).to eq('a')
          expect(subject.right.value).to eq('c')

          expect(subject.right.instance_of?(Node)).to eq(true)
          # expect(subject.right.right.value).to eq('d')
        end
      end
    end
  end

  # describe '#accept' do
  #   let(:value) { "foo" }
  #   context 'when a value is padded' do
  #     it 'should return the current value with parentheses around it' do
  #       expect(subject.accept(ConcreteVisitor.new)).to eq("(foo)")
  #     end
  #   end
  # end

  describe '#visit_component_with_value' do
    let(:value) { "foo" }
    it 'should return the value' do
      expect(subject.visit_component_with_value).to eq(value)
    end
  end
end
