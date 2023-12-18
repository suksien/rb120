class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi # Hello

hello = Hello.new
hello.bye # NoMethodError since neither `Hello` nor its parent class has a `bye` methode defined

hello = Hello.new
hello.greet # ArgumentError (given 0, expected 1)

hello = Hello.new
hello.greet("Goodbye") # Goodbye

Hello.hi # NoMethodError since `hi` is an instance method, not a class method