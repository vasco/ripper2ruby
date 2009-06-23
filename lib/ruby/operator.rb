require 'ruby/node'

module Ruby
  class Unary < DelimitedAggregate
    child_accessor :operator, :operand

    def initialize(operator, operand, ldelim, rdelim)
      self.operator = operator or raise "operator can not be nil"
      self.operand = operand
      super(ldelim, rdelim)
    end
    
    def nodes
      [operator, ldelim, operand, rdelim]
    end
  end
  
  class Binary < Aggregate
    child_accessor :operator, :left, :right

    def initialize(operator, left, right)
      self.operator = operator or raise "operator can not be nil"
      self.left = left 
      self.right = right
    end
    
    def nodes
      [left, operator, right]
    end
  end
  
  class IfOp < Aggregate
    child_accessor :condition, :left, :right, :operators

    def initialize(condition, left, right, operators)
      self.condition = condition
      self.left = left
      self.right = right
      self.operators = operators
    end
    
    def nodes
      [[condition, left, right].zip(operators)].flatten.compact
    end
  end
end