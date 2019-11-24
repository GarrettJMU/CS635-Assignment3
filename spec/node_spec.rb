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

  describe '#insert' do
    let(:value) {'b'}
    context 'when it is less than' do
      it 'should add it as the left node' do
        subject.insert('a')
        expect(subject.left.value).to eq('a')
      end
    end

    context 'when it is equal to' do
      it 'should add it as the left node' do
        subject.insert('b')
        expect(subject.left.value).to eq('b')
      end
    end

    context 'when it is greater than' do
      it 'should add it as the right node' do
        subject.insert('c')
        expect(subject.right.value).to eq('c')
      end
    end

    context 'when there are multiple values' do
      it 'should add it to the correct nodes' do
        subject.insert('d')
        subject.insert('a')
        expect(subject.left.value).to eq('a')
        expect(subject.right.value).to eq('d')
      end
    end

    context 'when the node is full' do
      it 'should create a new node' do
        subject.insert('a')
        subject.insert('c')
        subject.insert('d')
        expect(subject.left.value).to eq('a')
        expect(subject.right.value).to eq('c')

        expect(subject.right.instance_of?(Node)).to eq(true)
        expect(subject.right.right.value).to eq('d')
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
