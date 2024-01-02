class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    puts "Hello"
    # greet("Hello")
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
Hello.new.hi 

# cannot simply call `greet` on in `self.hi`, because the `Greeting` class
# defines `greet` on its instances

# key point: class methods