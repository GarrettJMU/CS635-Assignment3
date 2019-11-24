require 'spec_helper'
require_relative '../lib/nil_node'
require_relative '../lib/binary_search_tree'

RSpec.describe NullNode do
  let(:klass) { double('class') }
  subject { NullNode.new(klass) }

  describe '#initialize' do
    it 'should set the params as the parent' do
      expect(subject.parent).to eq(klass)
    end
  end

  describe '#left' do
    it 'should be a noop' do
      expect(subject.left).to eq(nil)
    end
  end

  describe '#right' do
    it 'should be a noop' do
      expect(subject.right).to eq(nil)
    end
  end

  describe '#value' do
    it 'should be a noop' do
      expect(subject.value).to eq(nil)
    end
  end

  describe '#set_parents_left_node' do
    let(:klass) { Node.new(5) }

    before(:each) do
      subject.set_parents_left_node(3)
    end

    it 'should set the left value on the parent class' do
      expect(klass.left.value).to eq(3)
    end

    it 'should implement a new node' do
      expect(klass.left.instance_of?(Node)).to eq(true)
    end
  end

  describe '#set_parents_right_node' do
    let(:klass) { Node.new(5) }

    before(:each) do
      subject.set_parents_right_node(7)
    end

    it 'should set the right value on the parent class' do
      expect(klass.right.value).to eq(7)
    end

    it 'should implement a new node' do
      expect(klass.right.instance_of?(Node)).to eq(true)
    end

  end

  describe '#set_root_node' do
    let(:klass) { BinarySearchTree.new(double('strategy')) }
    before(:each) do
      subject.set_root_node(7)
    end
    it 'should set the root on the parent class' do
      expect(klass.root.value).to eq(7)
    end

    it 'should imsert a new node' do
      expect(klass.root.instance_of?(Node)).to eq(true)
    end
  end

  describe '#insert' do
    context 'when parent is BinarySearchTree' do
      let(:parent) { BinarySearchTree.new(double('strategy')) }

      it 'should set the root node if parent is equal to the same class' do
        parent.root.insert(5)

        expect(parent.root.value).to eq(5)
        expect(parent.root.instance_of?(Node)).to eq(true)
      end
    end

    context 'when parent is a Node' do
      let(:parent) { Node.new(3) }

      it 'should set the right node if parent is equal to the same class' do
        parent.right.insert(5)

        expect(parent.right.value).to eq(5)
        expect(parent.right.instance_of?(Node)).to eq(true)
      end

      it 'should set the left node if parent is equal to the same class' do
        parent.left.insert(1)

        expect(parent.left.value).to eq(1)
        expect(parent.left.instance_of?(Node)).to eq(true)
      end
    end
  end

  describe '#accept' do
    let(:visitor) { double('visitor') }

    it 'should call the visitor with itself' do
      expect(visitor).to receive(:visit_component_with_nil).with(subject)
      subject.accept(visitor)
    end
  end

  describe '#visit_component_with_nil' do
    it 'should return empty parentheses' do
      expect(subject.visit_component_with_nil).to eq("()")
    end
  end

end
