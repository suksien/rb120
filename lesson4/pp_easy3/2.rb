class Greeting
  # def self.greet
  #   greet("Hello")
  # end

  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    puts "Hello"
    #greet("Hello")
  end

  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi
# cannot simply call `greet` on in `self.hi`, because the `Greeting` class
# defines `greet` on its instances