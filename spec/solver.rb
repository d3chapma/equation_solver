require 'rspec'
require_relative '../solver'

describe Solver do
  context 'can evaluate expressions in Reverse Polish Notation such as:' do
    it '1 + 2' do
      rpn = ['1', '2', '+']
      expect(subject.evaluate(rpn)).to eq(3)
    end
  end
end
