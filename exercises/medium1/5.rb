class InvalidTokenError < StandardError; end
class EmptyStackError < StandardError; end

class Minilang
  attr_reader :cmd
  attr_accessor :register, :stack

  TOKENS = ['PUSH', 'ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP', 'PRINT'].freeze

  def initialize(cmd)
    @register = 0
    @stack = []
    @cmd = cmd
  end

  def is_number?(prog)
    prog =~ /[0-9]/
  end

  def eval
    cmd.split.each do |prog|
      if TOKENS.include?(prog)
        case prog
          when TOKENS[0] then stack << register
          when TOKENS[1] then self.register += stack.pop
          when TOKENS[2] then self.register -= stack.pop
          when TOKENS[3] then self.register *= stack.pop
          when TOKENS[4] then self.register /= stack.pop
          when TOKENS[5] then self.register %= stack.pop
          when TOKENS[6]
            raise(EmptyStackError, 'Empty stack!') if stack.empty?
            self.register = stack.pop
          when TOKENS[7] then p register
        end
      elsif is_number?(prog)
        self.register = prog.to_i
      else
        raise(InvalidTokenError, "Invalid token: #{prog}")
      end
    end
    
    rescue EmptyStackError => error
      puts error.message
    rescue InvalidTokenError => error
      puts error.message
  end

end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)