module Solver
  SPLITTER = /(\d+|\+|\-|\*|\/)/

  def self.parse(infix)
    tokens = infix.split(SPLITTER)

    output = []
    operators = []

    tokens.each do |token|
      case type(token)
      when :operand then output.push(token)
      when :operator then operators.push(token)
      end
    end

    while operators.length > 0
      output.push(operators.pop)
    end

    output
  end

  def self.evaluate(rpn)
    output = []

    rpn.each do |token|
      case type(token)
      when :operand then output << Integer(token, 10)
      when :operator then
        operand2, operand1 = [output.pop, output.pop]
        output << operate(token, operand1, operand2)
      end
    end

    output.first
  end

  def self.type(token)
    case token
    when /\d+/ then :operand
    when /[\+\-\/\*]/ then :operator
    end
  end

  def self.operate(operator, operand1, operand2)
    case operator
    when '+' then operand1 + operand2
    when '-' then operand1 - operand2
    when '*' then operand1 * operand2
    when '/' then operand1 / operand2
    end
  end
end
