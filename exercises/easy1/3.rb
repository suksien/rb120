=begin
Complete this program so that it produces the expected output:

The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.
=end

class Book
  #attr_reader :author, :title
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

=begin
`attr_reader` creates a getter method and `attr_writer` creates a setter method. 
`attr_accessor` creates both a getter and setter method. 

The manual getter method does NOT change the behavior of the class in anyway because
it is the same as invoking `attr_reader`. 

Defining a manual getter method will be useful if we need additional formatting on the 
return value of the getter method, otherwise we should default to using the provided
accessor methods. 
=end