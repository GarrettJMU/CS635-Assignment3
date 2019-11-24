require 'spec_helper'
require_relative '../lib/binary_search_tree'
require_relative '../lib/concrete_forward_strategy'
require_relative '../lib/concrete_reverse_strategy'

RSpec.describe BinarySearchTree do
  let(:strategy) { ConcreteForwardStrategy.new }
  subject { BinarySearchTree.new(strategy) }

  describe '#insert' do
    context 'when there is no Node at the root' do
      before(:each) do
        subject.insert('foo')
      end
      it 'should create a new node if there is a null node' do
        expect(subject.root.instance_of?(Node)).to eq(true)
      end

      it 'should add the value to the new node' do
        expect(subject.root.value).to eq('foo')
      end
    end

    context 'when there is no Node at the root' do
      before(:each) do
        subject.insert('foo')
        subject.insert('bar')
        expect(subject.root.value).to eq('foo')
      end

      it 'should insert into the Node' do
        expect(subject.root.left.instance_of?(Node)).to eq(true)
      end

      it 'should add the value to the new node' do
        expect(subject.root.left.value).to eq('bar')
      end
    end
  end


  describe '#visualize' do
    context 'when there are no nodes' do
      it 'should return ()' do
        expect(subject.visualize).to eq("()")
      end
    end

    context 'when there are nodes' do
      # it 'should return a visualization' do
      #   subject.insert("foo")
      #   expect(subject.root.value).to eq("foo")
      #   expect(subject.visualize).to eq("(foo () ())")
      # end

      it 'should show the entire representation of the node' do
        subject.insert("b")
        subject.insert("a")
        subject.insert("c")

        expect(subject.root.value).to eq("b")
        expect(subject.root.left.value).to eq("a")
        expect(subject.root.right.value).to eq("c")
        # expect(subject.visualize).to eq("(b (a () ()) (c () ()))")
      end
    end
  end

  describe '#search' do
    context 'when there are values' do
      context 'when lexicographic' do
        subject { BinarySearchTree.new(ConcreteForwardStrategy.new) }

        before(:each) do
          node_values = ['c', 'b', 'a', 'd']
          node_values.each do |value|
            subject.insert(value)
          end
        end

        it 'should return the correct node' do
          expect(subject.search('a')).to eq(subject.root.left.left)
          expect(subject.search('b')).to eq(subject.root.left)
          expect(subject.search('c')).to eq(subject.root)
          expect(subject.search('d')).to eq(subject.root.right)
        end
      end

      # context 'when reverse lexicographic' do
      #   before(:each) do
      #     @klass = BinarySearchTree.new(ConcreteReverseStrategy.new)
      #
      #     node_values = ['aa', 'bz', 'cd', 'da']
      #     node_values.each do |value|
      #       @klass.insert(value)
      #     end
      #   end
      #
      #   it 'should return the correct node' do
      #     expect(@klass.search('aa')).to eq(@klass.root)
      #     expect(@klass.search('bz')).to eq(@klass.root.right)
      #     # expect(@klass.search('cd')).to eq(@klass.root.right)
      #     # expect(subject.search('da')).to eq(subject.root.left)
      #   end
      # end
    end

    context 'when there are no values' do
      it 'should return nil' do
        # expect(subject.search('a')).to eq(nil)
      end
    end
  end
end
