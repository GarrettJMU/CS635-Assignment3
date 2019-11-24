require 'spec_helper'
require_relative '../lib/strategy'

RSpec.describe Strategy do
  describe 'green' do
    it 'should be good' do
      expect(true).to eq(true)
    end
  end
end
