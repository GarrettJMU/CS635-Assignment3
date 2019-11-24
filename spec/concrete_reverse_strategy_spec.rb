require 'spec_helper'
require_relative '../lib/concrete_reverse_strategy'
require_relative '../lib/node'

RSpec.describe ConcreteReverseStrategy do
  subject { ConcreteReverseStrategy.new }
  let(:node) {Node.new('bz')}

  describe '#search' do
    it 'should search correctly' do

    end
  end

  describe '#insert' do
    it 'should insert greater than' do
      subject.insert('ez', node)
      expect(node.right.value).to eq('ez')
    end

    it 'should insert less than' do
      subject.insert('ca', node)
      expect(node.left.value).to eq('ca')
    end
  end
end
