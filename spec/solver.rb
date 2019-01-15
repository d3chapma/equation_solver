require 'rspec'
require_relative '../solver'

describe Solver do
  context '#evaluate can evaluate expressions in Reverse Polish Notation such as:' do
    it '1 + 2' do
      rpn = ['1', '2', '+']
      expect(subject.evaluate(rpn)).to eq(3)
    end

    it '((15 / (7 - (1 + 1))) * 3) - (2 + (1 + 1))' do
      rpn = ['15', '7', '1', '1', '+', '-', '/', '3', '*', '2', '1', '1', '+', '+', '-',]
      expect(subject.evaluate(rpn)).to eq(5)
    end
  end

  context '#parse converts infix notation to Reverse Polish Notation such as:' do
    it '1 + 2' do
      expression = "1 + 2"
      expect(Solver.parse(expression)).to eq(['1', '2', '+'])
    end
  end
end
