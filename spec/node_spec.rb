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
end
