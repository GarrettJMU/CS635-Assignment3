require 'spec_helper'
require_relative '../lib/component'

RSpec.describe Component do
  describe '#accept' do
    it 'should raise an error' do
      expect {Component.new.accept("")}.to raise_error(NotImplementedError)
    end
  end
end
