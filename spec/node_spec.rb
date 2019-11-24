require 'spec_helper'
require_relative '../lib/node'
require_relative '../lib/process_information'

RSpec.describe Node do
  let(:process_information) { ProcessInformation.new(name: "Garrett", owner: "Whitney", pid: 1, cpu_time: 2, cpu_usage: 3) }
  let(:first_node) { Node.new(process_information: ProcessInformation.new(name: "Lillie", owner: "Garrett", pid: 4, cpu_time: 5, cpu_usage: 6)) }
  let(:last_node) { Node.new(process_information: ProcessInformation.new(name: "Adam", owner: "Lillie", pid: 7, cpu_time: 8, cpu_usage: 9)) }

  context 'when the process information is present' do
    it 'should create a new class if all data is present' do
      new_node = Node.new(process_information: process_information, next_node: first_node, previous_node: last_node)

      expect(new_node.process_information).to eq(process_information)
      expect(new_node.next_node).to eq(first_node)
      expect(new_node.previous_node).to eq(last_node)
    end

    it 'should create a new class even if there is no next_node' do
      new_node = Node.new(process_information: process_information, previous_node: last_node)

      expect(new_node.process_information).to eq(process_information)
      expect(new_node.previous_node).to eq(last_node)
      expect(new_node.next_node).to eq(nil)
    end

    it 'should create a new class even if there is no previous_node' do
      new_node = Node.new(process_information: process_information, next_node: first_node)

      expect(new_node.process_information).to eq(process_information)
      expect(new_node.next_node).to eq(first_node)
      expect(new_node.previous_node).to eq(nil)
    end
  end

  context 'when no process_information is passed in' do
    it 'should create the instance' do
      expect(Node.new(next_node: "Garrett")).to be_instance_of(Node)
      expect(Node.new.next_node).to eq(nil)
      expect(Node.new.previous_node).to eq(nil)
      expect(Node.new.process_information).to eq(nil)
    end
  end

  context 'when the process information is instantiated without correct params' do
    let(:process_information) { ProcessInformation.new(name: "Garrett") }

    it 'should throw an error' do
      expect { Node.new(process_information: process_information) }.to raise_error(ArgumentError, "missing keywords: owner, pid, cpu_time, cpu_usage")
    end
  end
end
