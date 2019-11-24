require 'spec_helper'
require_relative '../lib/binary_search_tree'

RSpec.describe BinarySearchTree do
  let(:mocked_strategy) {double('strategy')}
  subject {BinarySearchTree.new(mocked_strategy)}

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
end
