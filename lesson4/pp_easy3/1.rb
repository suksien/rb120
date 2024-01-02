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
# invoking the `hi` instance method, resulting in `Hello` to be printed

hello = Hello.new
hello.bye # NoMethodError 
# since neither `Hello` nor its parent class has a `bye` methode defined

hello = Hello.new
hello.greet # ArgumentError (given 0, expected 1)
# invoking the superclass `greet` method, which requires an argument, yet we are not
# passing in an argument in the method call above

hello = Hello.new
hello.greet("Goodbye") # Goodbye

Hello.hi # NoMethodError 
# since `hi` is an instance method and we are invoking it on the class

# key point: class inheritance