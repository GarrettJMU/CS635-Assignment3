require 'spec_helper'
require_relative '../lib/concrete_forward_strategy'
require_relative '../lib/node'

RSpec.describe ConcreteForwardStrategy do
  subject { ConcreteForwardStrategy.new }
  let(:node) {Node.new('b')}
  describe '#insert' do
    it 'should insert greater than' do
      subject.insert('c', node)
      expect(node.right.value).to eq('c')
    end

    it 'should insert less than' do
      subject.insert('a', node)
      expect(node.left.value).to eq('a')
    end
  end
end
