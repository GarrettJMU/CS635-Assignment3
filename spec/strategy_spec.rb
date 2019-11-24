require 'spec_helper'
require_relative '../lib/strategy'

RSpec.describe Strategy do
  describe '#do_algorithm' do
    it 'should raise an error' do
      expect {Strategy.new.search("")}.to raise_error(NotImplementedError)
    end
  end
end
